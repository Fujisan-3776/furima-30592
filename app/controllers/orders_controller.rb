class OrdersController < ApplicationController
  before_action :item_select

  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:order_delivery).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id,item_id: @item.id)
  end

  def item_select
    if params[:item_id] != nil
    @item =Item.find(params[:item_id])
    end
  end


end
