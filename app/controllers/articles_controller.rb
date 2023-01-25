class  ArticlesController < ApplicationController
  before_action :set_articles,only: %i[show , edit ,  destroy ]

  def index
    @articles = Article.all
     render json: @articles.to_json(include: { image_attachment: { include: :blob } }) 
  end
  
  def new
    @article = Article.new
  end

  def show
    render json: @article.to_json(include: { image_attachment: { include: :blob } })
  end

  def edit
    render json: @article
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
    @article = Article.find(params[:id])
    if @article.update(article_params)
     render json: @article , status: 200 
     #redirect_to articles_path
    end 
   end     

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
      redirect_to articles_path
  end

private
  def article_params
    params.require(:article).permit(:title, :description, :date, :day, :published , :image)
  end

  def set_articles
    @article = Article.find(params[:id])
  end

end
