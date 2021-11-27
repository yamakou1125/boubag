class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items.where(user_id: current_user.id)
  end

  # private

  # def category_params
  #   params.require(:category).permit(:category_id)
  # end

end
