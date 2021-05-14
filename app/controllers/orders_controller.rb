class OrdersController < ApplicationController
before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @order_streetaddress = OrderStreetaddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_streetaddress = OrderStreetaddress.new(order_streetaddress_params)
    if @order_streetaddress.valid?
      @order_streetaddress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_streetaddress_params 
    params.require(:order_streetaddress).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
