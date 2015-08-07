require 'rails_helper'

describe TraderService do

  before(:all) do
    @default_trader_name = 'defaultTestTrader'
    @trader_service = TraderService.new()
    Trader.create(:name => @default_trader_name)
  end

  it 'persist a trader object in DB' do
    result = @trader_service.register_trader('RspecTrader')
    expect(result).to_not be_nil
  end

  it 'select all trader from DB' do
    result = @trader_service.find_all()
    expect(result).to_not be_blank
  end

  it 'select one trader from DB with his name' do
    result = @trader_service.find_by_name(@default_trader_name)
    expect(result.name).to eq(@default_trader_name)
  end

  it 'get the agregateSum for the test trader' do
    trader = @trader_service.find_by_name('TestTraderForTrade')
    result = @trader_service.get_aggregate_sum(trader)
    p result
    expect(result).to_not be_nil
  end

  it 'select the test trader and rename it, twice' do
    upd_name = 'updatedTestTrader'

    result = @trader_service.find_by_name(@default_trader_name)
    expect(result.name).to eq(@default_trader_name)
    result.name = upd_name
    updatedResult = @trader_service.update_trader result
    expect(updatedResult).to be_truthy
    result = @trader_service.find_by_name(upd_name)
    expect(result.name).to eq(upd_name)
    result.name = @default_trader_name
    updatedResult = @trader_service.update_trader result
    expect(updatedResult).to be_truthy
  end
end
