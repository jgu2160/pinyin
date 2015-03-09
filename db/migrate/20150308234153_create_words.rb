class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :traditional
      t.text :simplified
      t.text :pronunciation
      t.text :definition
    end
  end
end
