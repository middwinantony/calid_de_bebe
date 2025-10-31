class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @order = current_user.orders.find_or_create_by(status: "pending")
    @order_item = @order.order_items.new(product: @product, price: @product.price, quantity: 1)

    if @order_item.save
      redirect_to @order, notice: "Product added to order"
    else
      redirect_to products_path, alert: "Could not add product"
    end
  end

  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      redirect_to @order_item.order, notice: "Order item updated!"
    else
      redirect_to @order_item.order, notice: "Could not update order items"
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to @order_item.order, notice: "Item removed from order"
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity)
  end
end
