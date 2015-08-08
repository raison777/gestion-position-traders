class TradeService
  def save_trade(trader, action, quantity, price)
    Trade.create(:trader_id => trader.id,
    :action_id => action.id,
    :date => Time.now,
    :price => price,
    :quantity => quantity)
  end

  def trades_for_trader(trader)
    if(trader.is_a? Trader)
      Trade.where(:trader_id => trader.id).order(date: :DESC)
    elsif(trader.is_a? Integer)
      Trade.where(:trader_id => trader).order(date: :DESC)
    elsif(trader.is_a? String)
      Trade.joins(:trader).where("traders.name =='#{trader}'").order(date: :DESC) #TODO : prévenir les injections SQL
    end
  end

  def delete_trade(trade)
    if(trade.is_a? Trade)
      trade.destroy
    elsif trade.is_a? Integer
      stored_trade = Trade.find(trade)
      if !stored_trade.nil?
        stored_trade.destroy #else raise exception
      end
    end
  end
end