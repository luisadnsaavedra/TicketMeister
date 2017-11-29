class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      #TODO: tests for the seats table
      t.belongs_to :concert, index: true, foreign_key: true, null: false
      t.text :row, null: false
      t.integer :number, null: false

      t.timestamps null: false
    end
  end
end
