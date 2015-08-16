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
      begin
      action = @action_service.find_by_name(trade_form.action_name)
      trader = @trader_service.find_by_name(trade_form.trader_name)
      Trade.create(:date=> Time.now, :quantity => trade_form.quantity,
                    :price => trade_form.price, :action_id => action.id, :trader_id => trader.id)
      flash[:success] = 'La nouvelle transaction a été sauvegardée avec succès".'
      rescue ActionNotFoundError => anfe
        flash[:error] = 'L\'action que vous avez indiquée n\'existe pas.'
        anfe.backtrace
      rescue TraderNotFoundError => tnfe
        flash[:error] = 'Le trader que vous avez renseigné n\'existe pas.'
        tnfe.backtrace
      end

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

  def autocomplete_trader
    if params[:term]
      @auto_traders = @trader_service.suggest(params[:term])
    end

    respond_to do |format|
      format.html {render nothing: true}
      format.json {render :json => @auto_traders.to_json}
    end
  end

  def autocomplete_action
    if params[:term]
      @auto_action = @action_service.suggest(params[:term])
    end

    respond_to do |format|
      format.html {render nothing: true}
      format.json {render :json => @auto_action.to_json}
    end
  end

end
