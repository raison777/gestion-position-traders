require 'rails_helper'

describe Action do
  before(:each) do
    @actionTest = Action.new()
    @actionTest.name = :MSmotors
  end

  it 'Create an Action object' do
    expect(@actionTest).to be_a Action
    expect(@actionTest.name).to_not be_empty
  end
end