class HomeController < ApplicationController

  def index
    @cats = Item.all
    
    # Adds cart when user logs-in
    if signed_in? && !current_user.cart
      @cart = Cart.new(id: current_user.id, name: "My Cart")
      current_user.cart = @cart
      @cart.save
    end

  end

  def show
    @cat_name = Item.find_by_title("#{params[:id].capitalize}")
    @cat_id = Item.find(@cat_name.id)
  end

end
