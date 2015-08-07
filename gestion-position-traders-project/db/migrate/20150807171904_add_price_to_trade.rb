class AddPriceToTrade < ActiveRecord::Migration
  def change
    add_column :trades, :price, :float
  end
end
