class Admin::ReportsController < AdminController

  def index
    @reports = Report.all
    @page_properties = {:header => "Report Listing"}
  end

  def edit
    @report = Report.find_by_id(params[:id])
    @page_properties = {:header => "Configure #{@report.try(:name_of_model)} Report"}
  end

  def update
    report=Report.find_by_id(params[:id])
    if report.update_attributes(downloadable_fields: change_report_params)
      redirect_to admin_report_download_url(report)
    else
      render :edit
    end
  end

  def download
    @report=Report.find(params[:report_id]) rescue render_404
    @page_properties = {:header => "Download #{@report.try(:name_of_model)} Report"}
  end

  def download_file
    if params[:report] and params[:report][:from_date] and params[:report][:to_date]
      report=Report.find(params[:report_id]) rescue (redirect_to action: :download)
      values=eval(report.name_of_model).where("created_at > ? and created_at < ?", params[:report][:from_date].to_date, params[:report][:to_date].to_date)
      if values.blank?
        redirect_to action: :download and return
      end
      send_data report.to_csv(values), :filename => "#{report.name_of_model}.csv",  :type => 'text/csv'
    else
      redirect_to action: :download
    end
  end

  private

  def change_report_params
    value=[]
    params[:report].each do |x,y|
      if y=="true"
        value << x
      end
    end
    value.to_s
  end

end
