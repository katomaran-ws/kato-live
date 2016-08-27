class Admin::ReportsController < AdminController

  def index
    @reports = Report.all
    @page_properties = {:header => "Download Report Listing"}
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
    @report=Report.find_by_id(params[:report_id])
    if !@report.blank?

    else
      render_404
    end
  end

  def download_file
    @report.download_csv
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
