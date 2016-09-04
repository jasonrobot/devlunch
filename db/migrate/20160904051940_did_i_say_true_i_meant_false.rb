class DidISayTrueIMeantFalse < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :plus_one, :boolean, :default => false
  end

  def down
    change_column :users, :plus_one, :boolean, :default => nil
  end
end
