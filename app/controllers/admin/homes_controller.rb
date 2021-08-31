class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all.reverse_order
    @amount = 0
  end
end
