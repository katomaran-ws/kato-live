class AdminController < ApplicationController

  layout "admin_layout"

  USER, PASSWORD = 'katomaran', 'robotics'

  before_filter :authentication_check

  def dashboard

  end

  def reports

  end

  def upload
    @page_properties.merge!(:header => "Asset Upload")
    @assets=Asset.all
  end

  def asset_form
    if params[:id].present?
      @page_properties.merge!(:header => "Edit Asset")
      @asset=Asset.find_by_id(params[:id])
    else
      @page_properties.merge!(:header => "New Asset")
      @asset=Asset.new
    end
  end

  def save_asset
    asset=Asset.find_by_id(params[:asset][:id])
    if asset.present?
      flag=asset.update_attributes(asset_params)
    else
      asset=Asset.new(asset_params)
      Asset.save_file(params[:asset][:location])
      asset.location="private/downloads/#{params[:asset][:location].original_filename}"
      flag=asset.save
    end
    if flag
      redirect_to upload_admin_index_path
    else
      render :asset_form
    end
  end

  private

  def authentication_check
    authenticate_or_request_with_http_basic do |user, password|
      user == USER && password == PASSWORD
    end
  end

  def asset_params
    params.require(:asset).permit(:id, :title, :alias_name, :status, :access_code, :location, :sequence_number)
  end

end
