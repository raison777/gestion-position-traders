class TraderService
  def update_trader(trader)
    stored_trader = self.find trader.id
    raise TraderNotFoundError, "The trader #{trader} doesn't exist." if stored_trader.nil?
    stored_trader.name = trader.name
    stored_trader.save()
  end

  def register_trader(trader)
    raise ArgumentError, 'You have to provide a name for the new trader' if trader.blank?
    Trader.create(:name => trader.name)
  end

  def delete_trader(trader)
    if trader.is_a? Trader
    trader.destroy
    elsif trader.is_a? Integer
      trader = Trader.find(trader)
      raise TraderNotFoundError, "The trader #{trader} doesn't exist." if trader.nil?
      trader.destroy
    end
  end

  def find(id)
    Trader.find(id)
  end

  def find_by_name(name)
    result = Trader.find_by name: name
    raise TraderNotFoundError, "cannot find any trader for name #{name}" if result.nil?
    return result
  end

  def find_all()
    Trader.all
  end

  def list_with_aggregate_sum
    Dac.execute_query('SELECT t.id, t.name, SUM(trades.quantity * trades.price) AS agg FROM traders as t LEFT OUTER JOIN trades ON trader_id = t.id GROUP BY t.id ORDER BY agg DESC;')
  end


  def suggest(term)
    Trader.select(:id, :name).where('traders.name LIKE ?', term + '%')
  end

  deprecate :suggest, :find_all, :find, :delete_trader, :register_trader, :update_trader

end