# encoding: utf-8
class TradersController < ApplicationController

  def initialize
    super()
    @trader_service = TraderService.new
    @trade_service = TradeService.new
  end

  # listing all traders with agreggate sum of sold trades
  def index
    @lines = @trader_service.list_with_aggregate_sum
  end

  # provide details on one trader
  def show
    params.require(:id)
    if(params[:id].to_i > 0)
      @trader = @trader_service.find(params[:id].to_i)
      @sells = @trade_service.trades_for_trader(@trader)
    else
      redirect_to action: :index
    end
  end

  # provide form for creation
  def new
  end

  # creation post
  def create
    trader = Trader.new(trader_param)
    if(trader.valid?)
      @trader_service.register_trader(trader)
      flash[:success] = 'Le trader a été crée.'
    else
      flash[:error] = 'Les données fournies sont incorrectes.'
    end
    redirect_to action: :new
  end

  # provide form for editing
  def edit
    if(params[:id].is_a? Integer && params[:id] > 0)
      @trader = @trader_service.find(param[:id])
    elsif
    redirect_to action: :list
    end
  end

  # edit post
  def update
    if params[:trader].is_a? Trader
      @trader_service.update_trader(params[:trader])
    end
    redirect_to show, :id => params[:trader].id
  end

  # destruction of a trader with its id
  def destroy
    params.require(:id)
    @trader_service.delete_trader(params[:id])
    redirect_to action: :list
  end

  #strong parameters validation for trader
  def trader_param
    params.require(:trader).permit(:id, :name)
  end

end
