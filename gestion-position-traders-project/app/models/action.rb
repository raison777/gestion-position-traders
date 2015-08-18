# == Schema Information
#
# Table name: actions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  price      :float
#

class Action < ActiveRecord::Base

  has_many :trades, dependent: :destroy
  has_many :traders, through: :trades

  validates :name, presence: true,
            :length => {:minimum => 3, :maximum => 140},
            :uniqueness => true
  validates :price, :numericality =>{:greater_than => 0}


  def self.suggest(term)
    Action.select(:id, :name).where('actions.name LIKE ?', term + '%')
  end

end
