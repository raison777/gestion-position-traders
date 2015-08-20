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

  has_many :trades, dependent: :destroy
  has_many :actions, through: :trades

  validates :name, presence: true,
            :length => {:minimum => 3, :maximum => 140},
            :uniqueness => true

  # instance lvl methods
  def aggregate_sum
    self.trades.to_a.sum(&:price)
  end

end
