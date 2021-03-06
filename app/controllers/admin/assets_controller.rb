class Admin::AssetsController < AdminController
  require "fileutils"

  def index
    @page_properties.merge!(:header => "Asset Upload")
    @assets=Asset.all
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
    if params[:asset] and params[:asset][:type] == "asset"
      if params[:asset][:asset_type]=="Document"
        asset_params=params.require(:asset).permit(:id, :title, :alias_name, :status, :access, :location, :sequence_number, :asset_type)
        path="private/downloads"
      else
        asset_params=params.require(:asset).permit(:id, :title, :caption, :status, :sequence_number, :is_cloudinary, :gallery_id, :cloudinary_url, :asset_type)
        path="public/downloads/images"
      end
      @asset=Asset.new(asset_params)
      status=save_asset(path) if params[:asset][:location].present?
      status=@asset.save if params[:asset][:cloudinary_url].present?
    else
      gallery_params=params.require(:gallery).permit(:name, :caption, :description, :status)
      gallery=Gallery.new(gallery_params)
      status=gallery.save
    end

    if status
      redirect_to admin_assets_path
    else
      redirect_to :action => 'new'
    end
  end

  def update
    if params[:asset] and params[:asset][:type] == "asset"
      asset=Asset.find_by_id(params[:asset][:id])
      if asset.asset_type == "Document"
        asset_params=params.require(:asset).permit(:title, :alias_name, :status, :access, :location, :sequence_number)
      else
        asset_params=params.require(:asset).permit(:title, :caption, :status, :sequence_number, :is_cloudinary, :gallery_id, :cloudinary_url)
      end
      if asset.update_attributes(asset_params)
        redirect_to admin_assets_path
      else
        render 'asset_form'
      end
    else
      gallery=Gallery.find_by_id(params[:gallery][:id])
      gallery_params=params.require(:gallery).permit(:name, :caption, :status, :description, :title_image_id)
      if gallery.update_attributes(gallery_params)
        redirect_to admin_assets_path
      else
        render 'gallery_form'
      end
    end
  end

  private

  def save_asset(path)
    tmp = params[:asset][:location].tempfile
    file_name = params[:asset][:location].original_filename
    file = File.join(path, file_name.gsub(' ', '_'))
    FileUtils.cp tmp.path, file
    @asset.location=file.gsub('public/', '/').gsub('private/', '/')
    @asset.save
  end

end
