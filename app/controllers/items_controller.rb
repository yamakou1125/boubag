class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    date = params.require(:item).permit(:expiration_date)
    if params[:item]["expiration_date(1i)"].blank? || params[:item]["expiration_date(2i)"].blank? || params[:item]["expiration_date(3i)"].blank?
      @item.user_id = current_user.id
    else
      expiration_date = Date.parse( date["expiration_date(1i)"] + "-" + date["expiration_date(2i)"] + "-" + date["expiration_date(3i)"] )
      @item = Item.new(item_params.merge(expiration_date: expiration_date))
      @item.user_id = current_user.id
    end
    if @item.save
      flash[:notice] = "登録が完了しました。"
      redirect_to items_path
    else
      render :new
    end
  end

  def index
    @items = current_user.items
  end

  def show
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      @item = item
    else
      redirect_to root_path
    end
  end

  def edit
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      @item = item
    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    date = params.require(:item).permit(:expiration_date)
    if params[:item]["expiration_date(1i)"].blank? || params[:item]["expiration_date(2i)"].blank? || params[:item]["expiration_date(3i)"].blank?
      if @item.update(item_params)
        flash[:notice] = "更新が完了しました。"
        redirect_to item_path(@item.id)
      else
        render :edit
      end
    else
      expiration_date = Date.parse( date["expiration_date(1i)"] + "-" + date["expiration_date(2i)"] + "-" + date["expiration_date(3i)"] )
      if @item.update(item_params.merge(expiration_date: expiration_date))
        flash[:notice] = "更新が完了しました。"
        redirect_to item_path(@item.id)
      else
        render :edit
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "削除しました。"
      redirect_to items_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :amount, :category_id)
  end

end
