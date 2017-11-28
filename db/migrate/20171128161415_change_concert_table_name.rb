class ChangeTheaterTableName < ActiveRecord::Migration
  def change
    create_table :theaters do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps null: false
    end
  end

  def change
    add_index :theaters, :title, unique: true
  end
  
  def change
    rename_table :theaters, :theaters
  end

end
