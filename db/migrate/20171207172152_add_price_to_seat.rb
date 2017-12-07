class AddPriceToSeat < ActiveRecord::Migration
  def change
    add_column :seats, :price, :decimal, :default => 0.00
  end
end
