class TradeForm
  include ActiveModel::Model
  attr_accessor :trader_name, :action_name, :quantity, :price

  validates :trader_name, presence: true
  validates :action_name, presence: true
  validates :quantity, :numericality =>{:greater_than => 0}

end