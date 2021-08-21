class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.page(params[:page]).reverse_order
  end

  def show
    @genres = Genre.all
  end
end
