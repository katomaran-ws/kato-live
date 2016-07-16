class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :check_admin

  def check_admin
    p request.url
    @admin=true if request.url.include?("admin")
  end
end
