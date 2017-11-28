class AddIndexToTheaters < ActiveRecord::Migration
  def change
    add_index :theaters, :title, unique: true
  end
end
