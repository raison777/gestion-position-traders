class AddPriceToActions < ActiveRecord::Migration
  def change
    add_column :actions, :price, :float
  end
end
