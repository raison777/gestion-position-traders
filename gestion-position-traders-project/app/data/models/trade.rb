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
#  price      :float
#

class Trade < ActiveRecord::Base
  default_scope {order('created_at DESC')}

  belongs_to :action
  belongs_to :trader

  validates :trader_id, presence: true
  validates :action_id, presence: true
  validates :quantity, :numericality =>{:greater_than => 0}
  validates :date, presence: true

end
