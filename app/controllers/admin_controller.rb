class AdminController < ApplicationController

  layout "admin_layout"

  USER, PASSWORD = 'katomaran', 'robotics'

  before_filter :authentication_check



  private

  def authentication_check
    authenticate_or_request_with_http_basic do |user, password|
      user == USER && password == PASSWORD
    end
  end

end
