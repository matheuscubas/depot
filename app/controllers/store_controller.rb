class StoreController < ApplicationController
  include CurrentCart
  before_action :initialize_visit_counter
  before_action :increment_visit_counter
  before_action :get_time
  before_action :set_cart

  def index
    @products = Product.order(:title)
  end
end
