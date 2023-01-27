class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all     
  end
  
  def new
    @category = Category.new
  end

  def show

    @category = Category.find(params[:id])
  end

  def create
    
    @category = Category.new(category_params.merge(client_id: current_client.id))
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end   
  end

private
  def category_params
     params.require(:category).permit(:name , :client_id)
  end
end
