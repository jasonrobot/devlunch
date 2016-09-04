class CreatePicks < ActiveRecord::Migration[5.0]
  def change
    create_table :picks do |t|
      t.boolean :done

      t.timestamps
    end
  end
end
