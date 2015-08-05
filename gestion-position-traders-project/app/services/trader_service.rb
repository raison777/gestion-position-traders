class TraderService
  def update_trader(trader)
    trader.save()
  end

  def register_trader(name)
    Trader.create(:name => name)
  end

  def delete_trader(trader)
    trader.destroy
  end

  def find_by_name(name)
    Trader.find_by name: name
  end

  def find_all()
    Trader.all
  end
end