class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    @order = current_user.orders.new(order_params)
    if @order.save
      redirect_to@order, notice: "Order created successfully"
    else
      redirect_to products_path, alert: "Could not create order"
    end
  end

  private

  def order_params
    params.require(:order).permit(:shipping_address_id, :payment_method)
  end
end
