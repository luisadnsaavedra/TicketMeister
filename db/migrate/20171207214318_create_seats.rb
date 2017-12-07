class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.belongs_to :concert, index: true, foreign_key: true
      t.text :row
      t.integer :number
      t.decimal :price

      t.timestamps null: false
    end
  end
end
