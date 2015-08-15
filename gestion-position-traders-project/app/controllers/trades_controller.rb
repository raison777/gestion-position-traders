# encoding: utf-8
class TradesController < ApplicationController
  def initialize
    super()
    @trades_service = TradeService.new
    @action_service = ActionService.new
    @trader_service = TraderService.new
  end

  # listing
  def index
    @trades = @trades_service.find_all
  end

  def edit
    render :file => 'notImplemented.html.erb'
  end

  def update
    render :file => 'notImplemented.html.erb'
  end

  def show
    render :file => 'notImplemented.html.erb'
  end

  # creation form
  def new
  end

  # creation post
  def create
    trade_form = TradeForm.new(trade_param)
    if(trade_form.valid?)
      action = @action_service.find_by_name(trade_form.action_name)
      trader = @trader_service.find_by_name(trade_form.trader_name)
      Trade.create!(:date=> Time.now, :quantity => trade_form.quantity,
                        :price => trade_form.price, :action_id => action.id, :trader_id => trader.id)
      flash[:success] = 'La nouvelle transaction a été sauvegardée avec succès".'
    else
      flash[:error] = 'Les données fournies sont incorrectes.'
    end
    redirect_to action: :new
  end

  # destruction with id
  def delete
    params.require(:id)
    @trades_service.delete_trade params[:id]
  end

  # string parameter validation
  def trade_param
    params.require(:trade).permit(:trader_name, :action_name, :quantity, :price)
  end
end
