class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result(distinct: true)
  end

  def show
  end

  def update
  end
end
