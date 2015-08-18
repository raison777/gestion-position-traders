# == Schema Information
#
# Table name: trades
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  trader_id  :integer
#  action_id  :integer
#

require 'rails_helper'

describe Trade do
  before(:each) do
    @transactionTest = Trade.new()
    @transactionTest.quantity = 5
    @transactionTest.date = Time.now()
    @transactionTest.trader = Trader.new()
    @transactionTest.action = Action.new()
  end

  it 'Create an Action object' do
    expect(@transactionTest).to be_a Trade
    expect(@transactionTest.quantity).to be(5)
    expect(@transactionTest.trader).to_not be_nil
    expect(@transactionTest.action).to_not be_nil
  end
end
