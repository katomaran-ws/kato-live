class Admin::ArticlesController < AdminController

  def new
    @articles = Article.new
    @page_properties = {:header => "Create New Article"}
  end

  def create
    @articles = Article.new(article_params)
    if @articles.save
      redirect_to list_articles_url
    else
      render 'new'
    end
  end

  def edit
    @articles = Article.find(params[:id])
    @page_properties = {:header => "Edit Article"}
  end

  def update
    @articles = Article.find(params[:article][:id])
    @articles.update_attributes(article_params)
    if @articles.save
      redirect_to articles_url
    else
      render 'edit'
    end
  end

  def index
    # @articles = Article.all.by_updated
    @page_properties = {:header => "Article Listing"}
  end

  private

  def article_params
    params.require(:article).permit(:id, :title, :description, :content, :status, :alias_url, :img_url, :content_url, :article_type, :status, :sequence_number)
  end

end
