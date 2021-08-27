class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.page(params[:page]).reverse_order
  end

  def about
  end
end
