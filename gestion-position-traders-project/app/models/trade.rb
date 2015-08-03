class Trade < ActiveRecord::Base
  belongs_to :action
  belongs_to :trader

  validates :id_trader, presence: true
  validates :id_action, presence: true
  validates :quantity, :numericality =>{:greater_than => 0}
  validates :date, presence: true
end
