class OrderController < ApplicationController
  def index
    @all_orders = Order.where(user_id: current_user.id)
  end

  def create
    @all_orders = Order.where(user_id: current_user.id)

    @check_cart_status = Cart.find(current_user.id).items.empty?

    @current_cart = Cart.find(current_user.id)
    @total_price = []
    item_price = @current_cart.items
    item_price.each do |f|
      f.price
      @total_price << f.price
    end
    @final_price = @total_price.sum.round(2)

    if @check_cart_status
      redirect_to home_index_path
    else
      @current_cart = Cart.find(params[:cart])
      @new_order = Order.new(user_id: params[:cart]).save
      @current_order = Order.where(user_id: params[:cart]).last

      @current_order.items << @current_cart.items
      @current_order.price = @final_price
      @current_order.save

      # Clear the current cart items on checkout/purchase.
      @current_cart.items.destroy(@current_cart.items)
      UserMailer.order_email(@current_user).deliver_now!

      redirect_to order_index_path
    end
  end

end
