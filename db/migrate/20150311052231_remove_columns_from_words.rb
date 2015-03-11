class RemoveColumnsFromWords < ActiveRecord::Migration
  def change
    remove_column :words, :createdat
    remove_column :words, :updatedat
  end
end
