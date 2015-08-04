# == Schema Information
#
# Table name: actions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Action < ActiveRecord::Base
  attr_accessor :name
  has_many :trades
  has_many :trader, through: :trades

  validates :name, presence: true,
            :length => {:minimum => 3, :maximum => 140},
            :uniquenes => true
end
