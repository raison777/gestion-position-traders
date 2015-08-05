class RemoveIdTraderFromTrades < ActiveRecord::Migration
  def change
    remove_column :trades, :id_trader, :integer
  end
end
