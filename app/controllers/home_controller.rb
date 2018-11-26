class HomeController < ApplicationController
  def index
    @cats = Item.all
  end

  def show

  end
end
