class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @order = Order.all
    @q = Order.ransack(params[:q])
    @orders = @q.result(distinct: true)
  end

  def show
  end

  def update
  end
end
