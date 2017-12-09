class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :seat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
