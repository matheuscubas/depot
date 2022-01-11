class StoreController < ApplicationController
  before_action :initialize_visit_counter
  before_action :increment_visit_counter
  before_action :get_time

  def index
    @products = Product.order(:title)
  end
end
