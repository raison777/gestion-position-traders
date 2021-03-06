class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.integer :trader_id
      t.integer :action_id
      t.integer :quantity
      t.date :date

      t.timestamps null: false
    end
    add_index :trades, :date
  end
end
