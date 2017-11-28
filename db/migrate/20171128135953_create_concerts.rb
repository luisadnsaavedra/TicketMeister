class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
