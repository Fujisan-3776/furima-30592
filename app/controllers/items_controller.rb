class ItemsController < ApplicationController
  before_action :item_select, only: [:show, :destroy, :edit, :update, :index]
  before_action :move_to_login, except: [:index, :show]
  before_action :move_to_index, only: :edit

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
    if @item.user.id == current_user.id
      @item.destroy
    end
    redirect_to root_path
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
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

  def move_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_index  # deviseのauthenticate_user!メソッドにも置き換えられるが、「出品者以外のユーザーがURLの直接入力により出品していない商品の情報編集ページへ遷移できないようにする」という意図を示す為にmove_to_indexを採用している。
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end
  
end
