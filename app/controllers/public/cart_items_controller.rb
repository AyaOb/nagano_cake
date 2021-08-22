class Public::CartItemsController < ApplicationController
  def create
    if current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])
      @cart_item = current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])
      @cart_item.amount += cart_item_params[:amount].to_i
      @cart_item.update(amount: @cart_item.amount)
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
