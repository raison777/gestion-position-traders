class Trader < ActiveRecord::Base
  has_many :trades
  has_many :action, through: :trades
end
