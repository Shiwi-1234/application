class  ArticlesController < ApplicationController
  before_action :set_articles,only: %i[show , edit ,  destroy ]

  def index
    @articles = Article.all
     render json: @articles
  end
  
  def new
    @article = Article.new
  end

  def show
    render json: @article
  end

  def edit
    render json: @article
  end

  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.create(article_params)
      redirect_to category_path(@category)
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
     #render json: @article , status: 200 
     redirect_to articles_path
    end 
   end     

  def destroy
     @article.destroy
     redirect_to articles_path
  end

private
  def article_params
    params.require(:article).permit(:title, :description , :published ,:image, :category_id)
  end

  def set_articles
    @article = Article.find(params[:id])
  end

end
