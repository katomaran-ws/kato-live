class Admin::ArticlesController < AdminController

  def new
    @article = Article.new
    @page_properties = {:header => "Create New Article"}
  end

  def create
    @article = Article.new(article_params)
    @article_content = ArticleContent.new(article_content_params)
    Article.transaction do
      if @article.save!
        @article_content.article_id=@article.id
        if @article_content.save!
          redirect_to admin_articles_url
        else
          render 'new'
        end
      else
        render 'new'
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
    @article_content = @article.article_content
    @page_properties = {:header => "Edit Article"}
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
    @articles = Article.all.by_updated
    @page_properties = {:header => "Article Listing"}
  end

  private

  def article_params
    params.require(:article).permit(:id, :title, :description, :status, :alias_url, :article_type, :status, :sequence_number)
  end

  def article_content_params
    params[:article].require(:article_content).permit(:page_title, :meta_keywords, :meta_description, :content)
  end

end
