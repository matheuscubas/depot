class UpdateLineItemsPrice < ActiveRecord::Migration[6.1]
  def migrate_data
    LineItem.all.each do |line_item|
      line_item.price ||= 0
      line_item.price = line_item.product.price
      line_item.save
    end
  end
end
