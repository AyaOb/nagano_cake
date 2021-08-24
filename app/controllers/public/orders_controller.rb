class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address].to_i == 0
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address].to_i == 1
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
    end
    @cart_items = current_customer.cart_items
    @order.shipping_cost = 800
    @total = 0
    @cart_items.each do |cart_item|
      @total += cart_item.subtotal
    end
    @order.total_price = @order.shipping_cost + @total
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    # @order.save
    binding.pry
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new

    end
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_price)
  end
end
