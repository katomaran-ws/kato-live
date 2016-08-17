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
      @image=Image.new
      render 'gallery_form'
    else
      @page_properties.merge!(:header => "New Asset")
      @asset=Asset.new
      render 'asset_form'
    end
  end

  def edit
    @page_properties.merge!(:header => "Edit Asset")
    @asset=Asset.find_by_id(params[:id])
    if params[:type]=="asset"
      @page_properties.merge!(:header => "New Asset")
      @asset=Asset.new
      render 'asset_form'
    elsif params[:type]=="image"
      @page_properties.merge!(:header => "New Image")
      @image=Image.new
      render 'image_form'
    elsif params[:type]=="gallery"
      @page_properties.merge!(:header => "New Gallery")
      @image=Image.new
      render 'gallery_form'
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
