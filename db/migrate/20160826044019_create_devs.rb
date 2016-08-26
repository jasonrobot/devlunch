class CreateDevs < ActiveRecord::Migration[5.0]
  def change
    create_table :devs do |t|
      t.string :name
      t.string :hipchat_handle
      t.string :pick

      t.timestamps
    end
  end
end
