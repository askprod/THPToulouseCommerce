class ChargesController < ApplicationController

	def index  
	end

	def new
	end

	def create
	  # Amount in cents
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

	  @amount = (@final_price * 100).round

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
