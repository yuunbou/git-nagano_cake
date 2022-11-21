class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!


  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    #@total_price = current_customer.cart_items.cart_items_total_price(@cart_items)
    @order.shipping_cost = 800

    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = customer_customer.first_name + current_customer.last_name
      render 'confirm'

    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
      render 'confirm'

    elsif params[:order][:select_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      render 'confirm'
    else
      render :new
    end
  end

  def complete
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.customer_id = current_customer.id
    @order.save!
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item.id
      @order_detail.amount = cart_item.amount
      @order_detail.price = (cart_item.item.price*1.1).floor
      @order_detail.order_id = @order.id
      @order_detail.save
    end
      current_customer.cart_items.destroy_all
      redirect_to complete_path
  end

  def index
    @order = current_customer.orders
  end

  def show
    #@order = Order.find(params[:id])
    #@order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
  end

end
