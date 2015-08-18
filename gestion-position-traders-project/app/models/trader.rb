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

  # class lvl methods
  def self.list_with_agg_sum
    Trader.all.map{|t| {:id => t.id, :name => t.name, :aggregate_sum=> t.aggregate_sum}}
  end

  def self.suggest(term)
    Trader.select(:id, :name).where('traders.name LIKE ?', term + '%')
  end

  # instance lvl methods
  def aggregate_sum
    self.trades.to_a.sum(&:price)
  end

end
