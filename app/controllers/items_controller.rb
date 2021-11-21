class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    date = params.require(:item).permit(:expiration_date)
    expiration_date = Date.parse( date["expiration_date(1i)"] + "-" + date["expiration_date(2i)"] + "-" + date["expiration_date(3i)"] )
    @item = Item.new(item_params.merge(expiration_date: expiration_date))
    @item.user_id = current_user.id
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :amount, :category_id)
  end

end
