class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    # 注文入力画面から送られてきたデータを取得
    @order = Order.new(order_params)
    # 選択された住所のデータを格納
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
    @order.shipping_cost = POSTAGE
    @total = 0
    # カート内の商品合計金額を算出
    @cart_items.each do |cart_item|
      @total += cart_item.subtotal
    end
    @order.total_price = @order.shipping_cost + @total
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items
    # @cart_itemsの情報をOrderDetailモデルに格納
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    # カート内商品全削除
    @cart_items.destroy_all
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
