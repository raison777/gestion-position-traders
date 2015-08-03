# == Schema Information
#
# Table name: actions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Action do
  before(:each) do
    @actionTest = Action.new()
    @actionTest.name = :MSmotors
  end

  it 'Create an Action object' do
    expect(@actionTest).to be_a Action
    expect(@actionTest.name).to_not be_empty
    expect(@actionTest.save()).to be_truthy
  end
end
