class ChangeDateFormatInTrade < ActiveRecord::Migration
  def change
    change_column :trades, :date, :datetime
  end
end
