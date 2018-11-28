class OrderController < ApplicationController
  def index
    @all_orders = Order.where(user_id: current_user.id)
  end

  def create
    @check_cart_status = Cart.find(current_user.id).items.empty?

    if @check_cart_status
      redirect_to home_index_path
    else
      @current_cart = Cart.find(params[:cart])
      @new_order = Order.new(user_id: params[:cart]).save
      @current_order = Order.where(user_id: params[:cart]).last

      @current_order.items << @current_cart.items

      # Clear the current cart items on checkout/purchase.
      @current_cart.items.destroy(@current_cart.items)
      redirect_to order_index_path
    end
  end

end
