class ItemsController < ApplicationController
  before_action :item_select, only: [:show, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    unless user_signed_in?

      redirect_to new_user_session_path
    end

    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:price, :item_describe, :item_name, :category_id, :item_condition_id, :delivery_charge_id, :prefecture_id, :shipping_days_id, :user, :image).merge(user_id: current_user.id)
  end

  def item_select
    if params[:id] != nil
    @item =Item.find(params[:id])
    end
  end
  
end
