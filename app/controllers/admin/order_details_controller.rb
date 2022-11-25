class Admin::OrderDetailsController < ApplicationController

  #before_action :authenticate_admin!

  #def update
    #@order_detail = OrderDetail.find(params[:id])
    #@order = @order_detaill.order
    #@order_details = @order.order_details
    #@order_detail.update(order_detail_params)

    #if params[:order][:select_address] == "0"
      #@order.postal_code = current_customer.postal_code
      #@order.address = current_customer.address
      #@order.name = current_customer.first_name + current_customer.last_name
      #render 'confirm'
  #end

end
