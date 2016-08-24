class Admin::AssetsController < AdminController
  require "fileutils"

  def index
    @page_properties.merge!(:header => "Asset Upload")
    @assets=Asset.all
    @image=Image.all
    @gallery=Gallery.all
  end

  def new
    if params[:type]=="gallery"
      @page_properties.merge!(:header => "New Gallery")
      @gallery=Gallery.new
      render 'gallery_form'
    else
      @page_properties.merge!(:header => "New Asset")
      @asset=Asset.new
      render 'asset_form'
    end
  end

  def edit
    if params[:type]=="gallery"
      @page_properties.merge!(:header => "Edit Gallery")
      @gallery=Gallery.find_by_id(params[:id]) || Gallery.first   ## rescue in case of invalid id
      render 'gallery_form'
    else
      @page_properties.merge!(:header => "Edit Asset")
      @asset=Asset.find_by_id(params[:id]) || Asset.first   ## rescue in case of invalid id
      render 'asset_form'
    end
  end

  def create
    asset=Asset.new(asset_params)

    tmp = params[:asset][:location].tempfile
    file_name = params[:asset][:location].original_filename
    file = File.join("private/downloads", file_name)
    FileUtils.cp tmp.path, file

    asset.location=file

    if asset.save
      redirect_to admin_assets_path
    else
      render :new
    end
  end

  def update
    asset=Asset.find_by_id(params[:asset][:id])

    if asset.update_attributes(asset_params)
      redirect_to admin_assets_path
    else
      render :new
    end
  end

  private

  def asset_params
    params.require(:asset).permit(:id, :title, :alias_name, :status, :access, :location, :sequence_number)
  end

end
