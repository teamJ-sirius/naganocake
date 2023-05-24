class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @order = Order.all
    @q = Order.ransack(params[:q])
    @orders = @q.result(distinct: true)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
  end
end
