class StoreController < ApplicationController
  before_action :initialize_visit_counter
  before_action :increment_visit_counter

  def index
    @products = Product.order(:title)
    @time = Time.now
  end
end
