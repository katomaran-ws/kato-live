class BlogController < ApplicationController

  before_action :right_components, only: ['list_blog', 'tag_articles', 'category_articles']

  def list_blog
    @articles=Article.published_blog
  end

  def show_blog
    @article=Article.published_blog.find_by_alias_url(params[:article_alias_name])
    render_404 and return if @article.blank?
    @article_content=@article.article_content
  end

  def tag_articles
    @tag=Tag.find_by_alias_name(params[:tag_alias_name])
    render_404 if @tag.blank?
    @articles=Article.published_blog.by_tag(@tag.id)
  end

  def category_articles
    @category=Category.find_by_alias_name(params[:category_alias_name])
    render_404 if @category.blank?
    @articles=Article.published_blog.by_category(@category.id)
  end

  private

  def right_components
    @categories=Category.by_active
  end
end
