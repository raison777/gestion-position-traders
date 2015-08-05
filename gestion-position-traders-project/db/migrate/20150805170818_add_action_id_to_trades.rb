class AddActionIdToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :action_id, :integer
  end
end
