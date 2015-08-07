require 'rails_helper'

describe TradeService do

  before(:all) do
    @trader = Trader.create(:id=>9999, :name=>'TestTraderForTrade')
    @action = Action.create(:id=>9999, :name=>'TestActionForTrade')
    @traderService = TradeService.new
    Trade.create(:trader_id=>@trader.id, :action_id=>@action.id, :quantity => 100, :price=>120.5, :date=> Time.now)
  end

  it 'persist a new trade for an action by a trader' do
    result = @traderService.save_trade(@trader, @action, 50)
    expect(result).to_not be_nil
  end

  it 'get all trades for a trader object' do
    result = @traderService.trades_for_trader(@trader)
    expect(result).to_not be_empty
  end
  it 'get all trades for a trader id' do
    result = @traderService.trades_for_trader(@trader.id)
    expect(result).to_not be_empty
  end
  it 'get all trades for a trader name' do
    result = @traderService.trades_for_trader(@trader.name)
    expect(result).to_not be_empty
  end
end
