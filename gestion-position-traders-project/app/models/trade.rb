# == Schema Information
#
# Table name: trades
#
#  id         :integer          not null, primary key
#  id_trader  :integer
#  id_action  :integer
#  quantity   :integer
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Trade < ActiveRecord::Base
  belongs_to :action
  belongs_to :trader

  validates :id_trader, presence: true
  validates :id_action, presence: true
  validates :quantity, :numericality =>{:greater_than => 0}
  validates :date, presence: true
end
