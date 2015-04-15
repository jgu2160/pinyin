class AddIndexesToSimplifiedAndTraditional < ActiveRecord::Migration
  def change
    add_index :words, :simplified
    add_index :words, :traditional
  end
end
