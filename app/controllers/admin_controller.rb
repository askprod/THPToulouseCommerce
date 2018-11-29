class AdminController < ApplicationController

  def index
    @all_users = User.all
    @all_orders = Order.all
  end

end
