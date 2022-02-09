class AdminController < ApplicationController
  before_action :get_time

  def index
    @total_orders = Order.count
  end
end
