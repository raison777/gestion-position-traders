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
      redirect_to action: :list
    end
  end

  def new
    @trader = Trader.new
  end

  def create
    params.require(:trader)
    trader_service = TraderService.new
    trader = trader_service.create_trader_with_array params[:trader]
    p trader
    trader_service.register_trader(trader)
    redirect_to action: :new
  end

  def edit
    if(params[:id].is_a? Integer && params[:id] > 0)
      trader_service = TraderService.new
      @trader = trader_service.find(param[:id])
    elsif
    redirect_to action: :list
    end
  end

  def update
    params.require(:trader)
    if params[:trader].is_a? Trader
      trader_service = TraderService.new
      trader_service.update_trader(params[:trader])
    end
    redirect_to show, :id => params[:trader].id
  end

  def delete
    params.require(:id)
    trader_service = TraderService.new
    trader_service.delete_trader(Trader.create_or_retrieve_trader params[:id], params[:name])
    redirect_to action: :list
  end

end
