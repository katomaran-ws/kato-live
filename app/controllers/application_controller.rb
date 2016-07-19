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

end
