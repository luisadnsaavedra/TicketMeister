class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.belongs_to :theater, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
