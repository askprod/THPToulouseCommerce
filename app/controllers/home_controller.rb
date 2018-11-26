class HomeController < ApplicationController
  
  def index
    @cats = Item.all
  end

  def show
    @cat_id = Item.find(params[:id])
  end

end
