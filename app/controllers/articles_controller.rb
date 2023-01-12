class  ArticlesController < ApplicationController
  before_action :set_articles,only: %i[show , edit , update , destroy ]

  def index
    @articles = Article.all
      #render json: @articles
        if params[:search_by_title] && params[:search_by_title] != ""
      @articles = @articles.where("title like ?","%# {params[:search_by_title]}%")
    end
  end

  
  def new
    @article = Article.new
  end

  def show
    render json: @article
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end   
  end

  def update
    if @article.update(article_params)
      redirect_to @articles
    else
      render 'edit'
    end 
   end     

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
      redirect_to articles_path
  end

private
  
  def article_params
    params.require(:article).permit(:title, :description, :date, :day)
  end

  def set_articles
    @article = Article.find(params[:id])
  end

end
