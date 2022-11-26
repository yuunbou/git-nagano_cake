class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      redirect_to admin_order_path(@order.id)
    else
      render admin_order_path(@order.id)
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
