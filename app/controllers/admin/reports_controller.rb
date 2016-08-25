class Admin::ReportsController < AdminController

  def index
    @reports = Report.all
    @page_properties = {:header => "Download Report Listing"}
  end

  def edit
    @report = Report.find_by_id(params[:id])
    @page_properties = {:header => "Configure #{@report.try(:name_of_model)} Report"}
  end

  def create
    @report = Report.new(report_params)
  end

  def update
    report=Report.find_by_id(params[:id])
    if report.update_attributes(downloadable_fields: change_report_params)
      redirect_to admin_reports_url
    else
      render :edit
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
