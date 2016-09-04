class AddDefaultsToComingAndPlusOne < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :coming, :boolean, :default => true
    change_column :users, :plus_one, :boolean, :default => true
  end

  def down
    change_column :users, :coming, :boolean, :default => nil
    change_column :users, :plus_one, :boolean, :default => nil
  end
end
