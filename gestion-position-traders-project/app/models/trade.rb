# == Schema Information
#
# Table name: trades
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  trader_id  :integer
#  action_id  :integer
#

class Trade < ActiveRecord::Base
  default_scope {order('created_at DESC')}

  belongs_to :action
  belongs_to :trader

  validates :trader_id, presence: true
  validates :action_id, presence: true
  validates :quantity, :numericality =>{:greater_than => 0}
  validates :date, presence: true

  #class
  def self.list
    Trade.all.joins(:trader, :action).reorder(:id).pluck(:id, :date, :quantity, :price, 'traders.name as trader_name', 'actions.name as action_name').map{|t| {:id=>t[0], :date=>t[1], :quantity=>t[2], :price=>t[3],:trader_name=>t[4], :action_name=>t[5]}}
  end

  # instance
  def price
    self.quantity * self.action.price;
  end
end
