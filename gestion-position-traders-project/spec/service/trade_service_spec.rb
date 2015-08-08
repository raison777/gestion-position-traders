require 'rails_helper'

describe TradeService do

  before(:all) do
    @trader = Trader.create(:id=>9999, :name=>'TestTraderForTrade')
    @action = Action.create(:id=>9999, :name=>'TestActionForTrade')
    @tradeService = TradeService.new
    Trade.create(:trader_id=>@trader.id, :action_id=>@action.id, :quantity => 100, :price=>120.5, :date=> Time.now)
  end

  it 'persist a new trade for an action by a trader' do
    result = @tradeService.save_trade(@trader, @action, 50, 133.156)
    expect(result).to be_a Trade
  end

  it 'get all trades for a trader object' do
    result = @tradeService.trades_for_trader(@trader)
    expect(result).to_not be_empty
  end
  it 'get all trades for a trader id' do
    result = @tradeService.trades_for_trader(@trader.id)
    expect(result).to_not be_empty
  end

  it 'delete a trader with its id' do
    tmp_trade = @tradeService.save_trade(@trader, @action, 666, 156.133)
    p tmp_trade
    result = @tradeService.delete_trade(tmp_trade.id)
    expect(result).to be_a Trade
    result.destroy!
    expect(result).to be_a Trade
  end


  it 'get all trades for a trader name' do
    result = @tradeService.trades_for_trader(@trader.name)
    expect(result).to_not be_empty
  end
end
