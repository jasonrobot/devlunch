class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :id, index: true
      t.string :realname, :nickname, :pick, default: ""
      t.boolean :voting, :joining, :winner
    end
  end
end
