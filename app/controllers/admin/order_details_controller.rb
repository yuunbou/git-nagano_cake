class Admin::OrderDetailsController < ApplicationController

  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)
    if @order_detail.making_status_i18n == "製作中"
      @order.status = 2
      @order.save
    end
    @sum = 0
    @order_details.each do |order_detail|
      if order_detail.making_status_i18n == "製作完了"
        @sum += 1
      end
    end
    if @sum == @order_details.count.to_i
      @order.status = 3
      @order.save
    end
    redirect_to admin_order_path(@order_detail.order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
