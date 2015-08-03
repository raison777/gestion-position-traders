class Action < ActiveRecord::Base
  has_many :trades
  has_many :trader, through: :trades

  validates :name, :length => {:minimum => 3, :maximum => 140}
end
