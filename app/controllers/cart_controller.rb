class CartController < ApplicationController

  def index
    @current_cart = Cart.find(current_user.id)

    # Find total of each item in cart.
    # A modifier si possible en méthode à part
    @total_price = []
    item_price = @current_cart.items
    item_price.each do |f|
      f.price
      @total_price << f.price
    end
    @final_price = @total_price.sum.round(2)
  end

  def create
    @current_cart = Cart.find(current_user.id)
    @cart_item = Item.find(params[:cat_id])
    @current_cart.items << @cart_item
    redirect_to home_index_path
  end

  def destroy
    @current_cart = Cart.find(current_user.id)
    @cart_item = Item.find(params[:id])
    number_of_cats = @current_cart.items.where(id: @cart_item).count
    
    #Supprimer l'item du cart
    @current_cart.items.delete(@cart_item)

    # Cool feature
    if @current_cart.items.count > 0
      redirect_to cart_index_path
    else
      redirect_to home_index_path 
    end
  end

end
