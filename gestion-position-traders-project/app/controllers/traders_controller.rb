class TradersController < ApplicationController
  def list
    trader_service = TraderService.new
    @lines = trader_service.list_with_aggregate_sum
  end

  def show
    params.require(:id)
    if(params[:id].to_i > 0)
      trader_service = TraderService.new
      trade_service = TradeService.new
      @trader = trader_service.find(params[:id].to_i)
      @sells = trade_service.trades_for_trader(@trader)
    else
      redirect_to list
    end
  end

  def new

  end

  def create
    params.require(:name)
    trader_service = TraderService.new
    trader_service.register_trader(param[:name])
    redirect_to new
  end

  def edit
    if(params[:id].is_a? Integer && params[:id] > 0)
      trader_service = TraderService.new
      @trader = trader_service.find(param[:id])
    elsif
      redirect_to list
    end
  end

  def update
    params.require(:id, :name)
    trader_service = TraderService.new
    trader = Trader.create_trader params[:id], params[:name]
    trader_service.update_trader(trader)
    redirect_to show, :id => trader.id
  end

  def delete
    params.require(:id)
    trader_service = TraderService.new
    trader_service.delete_trader(Trader.create_trader params[:id], params[:name])
    redirect_to list
  end

end
