class RemoveIdActionFromTrades < ActiveRecord::Migration
  def change
    remove_column :trades, :id_action, :integer
  end
end
