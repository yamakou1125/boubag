class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    date = params.require(:item).permit(:expiration_date)
    # year month day hitotudemo kara deareba true!
    if params[:item]["expiration_date(1i)"].blank? || params[:item]["expiration_date(2i)"].blank? || params[:item]["expiration_date(3i)"].blank?
      @item.user_id = current_user.id
    else # subete karajanakereba
      expiration_date = Date.parse( date["expiration_date(1i)"] + "-" + date["expiration_date(2i)"] + "-" + date["expiration_date(3i)"] )
      @item = Item.new(item_params.merge(expiration_date: expiration_date))
      @item.user_id = current_user.id
    end
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end

  def index
    @items = current_user.items
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    date = params.require(:item).permit(:expiration_date)
    # year month day hitotudemo kara deareba true!
    if params[:item]["expiration_date(1i)"].blank? || params[:item]["expiration_date(2i)"].blank? || params[:item]["expiration_date(3i)"].blank?
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        render :edit
      end
    else # subete karajanakereba
      expiration_date = Date.parse( date["expiration_date(1i)"] + "-" + date["expiration_date(2i)"] + "-" + date["expiration_date(3i)"] )
      if @item.update(item_params.merge(expiration_date: expiration_date))
        redirect_to item_path(@item.id)
      else
        render :edit
      end
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :amount, :category_id)
  end

end
