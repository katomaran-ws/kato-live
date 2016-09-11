class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :check_admin, :set_page_properties

  def check_admin
    @admin=true if request.path.split('/')[1] == ("admin")
  end

  def set_page_properties
    @page_properties={:title => "Katomaran Robotics"}
  end

  def render_404
    render :file => "public/404", :layout => 'error_layout', :status => 404
  end

  def render_construction

  end

  def render_502

  end

end
