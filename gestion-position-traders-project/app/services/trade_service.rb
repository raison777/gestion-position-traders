class TradeService

  def find_all
    Dac.execute_query('SELECT t.id, t.date, t.quantity, t.price, tr.name as trader_name, a.name as action_name FROM trades as t INNER JOIN traders as tr ON t.trader_id = tr.id INNER JOIN actions as a ON t.action_id = a.id ORDER BY t.date')
  end

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
      Trade.joins(:trader).where('traders.name == ?', trader).order(date: :DESC)
    end
  end

  def delete_trade(trade)
    if(trade.is_a? Trade)
      trade.destroy
    elsif trade.is_a? Integer
      stored_trade = Trade.find(trade)
      raise ArgumentError, "The trade #{trade} doesn't exist." if stored_trade.nil?
      stored_trade.destroy #else raise exception
    end
  end
end