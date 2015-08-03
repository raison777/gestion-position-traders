# == Schema Information
#
# Table name: traders
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Trader < ActiveRecord::Base
  has_many :trades
  has_many :action, through: :trades

  validates :name, presence: true, :length => {:minimum => 3, :maximum => 140}
end
