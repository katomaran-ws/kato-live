class HomeController < ApplicationController

  def downloads
    @assets=Asset.active
  end

  def get_file
    asset=Asset.find_by_alias_name(params[:alias_name])
    if asset.present?
      if asset.access_code <= params[:access_code].to_i
        send_file "#{Rails.root}/#{asset.location}"
      else
        redirect_to get_access_code_url, :alias_name=>params[:alias_name]
      end
    else
      redirect_to root_url
    end
  end

  def index
    @services=Article.published_services.by_sequence
    @gallery=Gallery.all
  end

  def services
    @articles=Article.published_services.by_sequence
  end

  def show_case
    @gallery=Gallery.all
  end
end
