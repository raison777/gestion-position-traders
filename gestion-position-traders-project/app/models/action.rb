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
  has_many :trades
  has_many :traders, through: :trades

  validates :name, presence: true,
            :length => {:minimum => 3, :maximum => 140},
            :uniqueness => true
end
