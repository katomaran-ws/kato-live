class Admin::ReportsController < AdminController

  def index
    @reports = Report.all
    @page_properties = {:header => "Download Report Listing"}
  end

  def new
    @report = Report.new
  end

  def edit
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(report_params)

  end

  def update

  end

end
