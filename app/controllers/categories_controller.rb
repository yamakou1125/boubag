class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items.where(user_id: current_user.id)
  end

end
