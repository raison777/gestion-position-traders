class TraderService
  def update_trader(trader)
    trader.save()
  end

  def register_trader(name)
    Trader.create(:name => name)
  end

  def delete_trader(trader)
    if trader.is_a? Trader
    trader.destroy!
    elsif trader.is_a? Integer
      trader = Trader.create_trader(trader, nil)
      trader.destroy!
    end
  end

  def find(id)
    Trader.find(id)
  end

  def find_by_name(name)
    Trader.find_by name: name
  end

  def find_all()
    Trader.all
  end

  def list_with_aggregate_sum
        Trader.pluck("t.id, t.name, SUM(trades.quantity * trades.price) AS agg FROM traders as t LEFT OUTER JOIN trades ORDER BY agg DESC;")
  end

  def get_aggregate_sum(trader)
    if(trader.is_a?(Trader) && !trader.id.nil?)
      Trader.pluck("SUM(trades.quantity * trades.price) AS agg FROM traders as t LEFT OUTER JOIN trades WHERE trades.trader_id = #{trader.id} ORDER BY agg DESC;")
    end
  end
end