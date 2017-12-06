class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, :nickname, :pick, default: ""
      t.boolean :voting, :joining, :winner, default: false
    end
  end
end
