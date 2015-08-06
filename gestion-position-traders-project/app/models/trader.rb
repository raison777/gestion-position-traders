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


  def self.create_trader(id, name)
    trader = Trader.new
    if(!id.nil? &&id > 0)
      trader.id = id
    end
    if(!name.nil?)
      trader.name = name
    end
    return trader
  end

end
