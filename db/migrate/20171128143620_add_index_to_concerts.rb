class AddIndexToConcerts < ActiveRecord::Migration
  def change
    add_index :concerts, :title, unique: true
  end
end
