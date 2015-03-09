class AddPrimaryKeyToWords < ActiveRecord::Migration
  def change
    execute "ALTER TABLE words ADD PRIMARY KEY (id);"
  end
end
