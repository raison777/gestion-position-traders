require 'rails_helper'

describe Trader do
  before(:each) do
    @traderTest = Trader.new()
    @traderTest.name = 'sfoulon'
  end

  it 'Create an object Trader' do
    expect(@traderTest).to be_a Trader
    expect(@traderTest.name).to_not be_empty
  end
end