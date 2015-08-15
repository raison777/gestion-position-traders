class TraderService
  def update_trader(trader)
    storedTrader = self.find trader.id
    if(storedTrader.nil?)
      #"raise"
    end
    storedTrader.name = trader.name
    storedTrader.save()
  end

  def register_trader(trader)
    if(trader.name.nil?)
      #raise
    end
    Trader.create(:name => trader.name)
  end

  def delete_trader(trader)
    if trader.is_a? Trader
    trader.destroy!
    elsif trader.is_a? Integer
      trader = Trader.find(trader)
      trader.destroy!
    end
  end

  def find(id)
    Trader.find(id)
  end

  def find_by_name(name)
    result = Trader.find_by name: name
    if(result.nil?)
      #raise
    end
    return result
  end

  def find_all()
    Trader.all
  end

  def list_with_aggregate_sum
    result = Dac.execute_query('SELECT t.id, t.name, SUM(trades.quantity * trades.price) AS agg FROM traders as t LEFT OUTER JOIN trades ON trader_id = t.id GROUP BY t.id ORDER BY agg DESC;')
    puts 'result here : '
    p result
    return result
  end

  def get_aggregate_sum(trader)
    if(trader.is_a?(Trader) && !trader.id.nil?)
      Dac.execute_query('SELECT SUM(trades.quantity * trades.price) AS agg FROM traders as t LEFT OUTER JOIN trades ON trader_id = t.id WHERE trades.trader_id = ? GROUP BY t.id ORDER BY agg DESC;', trader.id)
    end
  end

  def create_trader_with_array(array)
    if(array[:name].nil?)
      #raise newException + validation plus poussée (par champs)
    end
    Trader.new(:name => array[:name])
  end
end