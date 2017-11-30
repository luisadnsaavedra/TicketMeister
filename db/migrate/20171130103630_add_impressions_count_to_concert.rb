class AddImpressionsCountToConcert < ActiveRecord::Migration
  def change
    add_column :concerts, :impressions_count, :int
  end
end
