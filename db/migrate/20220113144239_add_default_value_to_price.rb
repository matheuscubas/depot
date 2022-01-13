class AddDefaultValueToPrice < ActiveRecord::Migration[6.1]
  def change
    change_column_default :line_items, :price, default: 0
  end
end
