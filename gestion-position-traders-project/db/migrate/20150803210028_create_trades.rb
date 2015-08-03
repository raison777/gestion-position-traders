class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.integer :id_trader
      t.integer :id_action
      t.integer :quantity
      t.date :date

      t.timestamps null: false
    end
    add_index :trades, :date
  end
end
