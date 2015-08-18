class ChangePriceLocation < ActiveRecord::Migration
  def change
    drop_table :transactions
    remove_column :trades, :price
  end
end
