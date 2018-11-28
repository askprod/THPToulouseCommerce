class HomeController < ApplicationController
  
  def index
    @cats = Item.all
    
    if signed_in?
      @current_cart = Cart.find(current_user.id)
    end
    
    # Adds cart when user logs-in
    if signed_in? && !current_user.cart
      @cart = Cart.new(id: current_user.id, name: "My Cart")
      current_user.cart = @cart
      @cart.save
    end

  end

  def show
    @cat_id = Item.find(params[:id])
  end

end
