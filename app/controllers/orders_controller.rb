class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :sold_item
  before_action :order_item

  def index
    @order_streetaddress = OrderStreetaddress.new
  end

  def create
    @order_streetaddress = OrderStreetaddress.new(order_streetaddress_params)
    if @order_streetaddress.valid?
      pay_item
      @order_streetaddress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def sold_item
    redirect_to root_path if @item.order.present?
  end

  def order_item
    redirect_to root_path if @item.user.id == current_user.id
  end

  def order_streetaddress_params
    params.require(:order_streetaddress).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_streetaddress_params[:token],
      currency: 'jpy'
    )
  end
end
