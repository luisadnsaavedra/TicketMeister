class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.belongs_to :theater, index: true, foreign_key: true, null: false
      t.string :title, null: false

      t.timestamps null: false
    end
  end
end
