class BlogController < ApplicationController

  include ArticlesHelper

  before_action :right_components, only: ['list_blog', 'tag_articles', 'category_articles']

  def list_blog
    @articles=Article.published_blog
    @page_properties.merge!(page_properties_for("list_blog"))
  end

  def show_blog
    @article=Article.published_blog.find_by_alias_url(params[:article_alias_name])
    render_404 and return if @article.blank?
    @page_properties.merge!(page_properties_for("show_blog"))
    @article_content=@article.article_content
  end

  def tag_articles
    @page_properties.merge!(page_properties_for("tag_articles"))
    @tag=Tag.find_by_alias_name(params[:tag_alias_name])
    render_404 and return if @tag.blank?
    @articles=Article.published_blog.by_tag(@tag.id)
  end

  def category_articles
    @page_properties.merge!(page_properties_for("category_articles"))
    @category=Category.find_by_alias_name(params[:category_alias_name])
    render_404 and return if @category.blank?
    @articles=Article.published_blog.by_category(@category.id)
  end

  private

  def right_components
    @categories=Category.by_active
    @right_articles=Article.published_blog
  end
end
