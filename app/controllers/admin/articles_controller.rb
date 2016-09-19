class Admin::ArticlesController < AdminController

  def new_category
    @page_properties = {:header => "Create New Category"}
    @category=Category.new
  end

  def create_category
    category=Category.new(category_params)
    category.save ? (redirect_to admin_articles_path) : (render 'new_category')
  end

  def new_tag
    @page_properties = {:header => "Create New Tag"}
    @tag=Tag.new
  end

  def create_tag
    tag=Tag.new(tag_params)
    tag.save ? (redirect_to admin_articles_path) : (render 'new_tag')
  end

  def new
    @article = Article.new
    @page_properties = {:header => "Create New Article"}
  end

  def create
    article = Article.new(article_params)
    Article.transaction do
      render 'new' and return unless article.save!
      render 'new' and return unless article.create_article_content!(article_content_params)
      redirect_to admin_articles_url
    end
  end

  def edit
    @page_properties = {:header => "Edit Article"}
    @article = Article.find(params[:id])
    @article_content = @article.article_content
  end

  def update
    @article = Article.find(params[:article][:id])
    @article_content = @article.article_content
    if @article.update_attributes(article_params) and @article_content.update_attributes(article_content_params)
      redirect_to admin_articles_url
    else
      render 'edit'
    end
  end

  def index
    @page_properties = {:header => "Article Listing"}
    @articles = Article.order_by_type
  end

  private

  def article_params
    params.require(:article).permit(:id, :title, :description, :status, :alias_url, :article_type, :status, :sequence_number, :heading_block, :author, :category_id, :display_date, :tag_ids=>[])
  end

  def article_content_params
    params[:article].require(:article_content).permit(:banner_image_url, :page_title, :meta_keywords, :meta_description, :content)
  end

  def category_params
    params.require(:category).permit(:name, :full_name, :alias_name, :sequence_number, :status)
  end

  def tag_params
    params.require(:tag).permit(:name, :alias_name, :status)
  end

end
