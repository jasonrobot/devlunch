class AddPlusOneToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :plus_one, :boolean
  end
end
