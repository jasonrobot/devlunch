class AddPlusOneToDev < ActiveRecord::Migration[5.0]
  def change
    add_column :devs, :plus_one, :boolean
  end
end
