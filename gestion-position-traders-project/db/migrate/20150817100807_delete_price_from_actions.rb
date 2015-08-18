class DeletePriceFromActions < ActiveRecord::Migration
  def change
    remove_column :trades, :price
  end
end
