class ItemsController < ApplicationController
  def index
  end

  def new
    # 以下の記述はdeviseの「authenticate_iser!」メソッドに移行したが、メモとして残しておく
    # unless user_signed_in?

    #   redirect_to new_user_session_path
    # end
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

    private
    def item_params
      params.require(:item).permit(:price, :item_describe, :item_name, :category_id, :item_condition_id, :delivery_charge_id, :prefecture_id, :shipping_days_id, :user, :image).merge(user_id: current_user.id)
    end
  
end
