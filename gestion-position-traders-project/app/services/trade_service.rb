class TradeService
  def save_trade(trader, action, quantity)
    trade = Trade.new()
    trade.trader = trader
    trade.action = action
    trade.quantity = quantity
    trade.date = Time.now
  end

  def trades_for_trader(trader)
    if(trader.is_a? Trader)
      trades = Trade.where(:trader_id => trader.id).order(:date)
    elsif(trader.is_a? Integer)
      Trade.where(:trader_id => trader).order(:date)
    elsif(trader.is_a? String)
      Trade.joins(:trader).where("traders.name =='#{trader}'")
    end
  end
end