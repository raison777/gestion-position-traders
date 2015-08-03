require 'rails_helper'

describe Trade do
  before(:each) do
    @transactionTest = Trade.new()
    @transactionTest.quantity = 5
    @transactionTest.date = Time.now()
    @transactionTest.id_trader = 1
    @transactionTest.id_action = 1
  end

  it 'Create an Action object' do
    expect(@transactionTest).to be_a Trade
    expect(@transactionTest.quantity).to be(5)
    expect(@transactionTest.id_trader).to be(1)
    expect(@transactionTest.id_action).to be(1)
  end
end