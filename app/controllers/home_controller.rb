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

  def list_blog
    @article=Article.published.first
    @article_content=@article.article_content
  end

  def show_blog
    @article=Article.published.find_by_alias_url(params[:article_title])
    if @article.blank?
      render_404
    else
      @article_content=@article.article_content
      # just to render the same template
    end
  end

end
