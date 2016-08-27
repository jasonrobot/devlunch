class DropDevsTabls < ActiveRecord::Migration[5.0]
  def change
      drop_table :devs
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
