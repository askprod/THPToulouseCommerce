class HomeController < ApplicationController
  def index
  end

  def show
    @cats = Item.all
  end
end
