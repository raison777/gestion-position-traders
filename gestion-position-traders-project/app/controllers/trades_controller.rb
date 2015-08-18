# encoding: utf-8
class TradesController < ApplicationController
  # listing
  def index
    @trades = Trade.list
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
      action = Action.find_by(:name=>trade_form.action_name)
      trader = Trader.find_by(:name=>trade_form.trader_name)
      Trade.create(:date=> Time.now, :quantity => trade_form.quantity,
                    :action_id => action.id, :trader_id => trader.id)
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
    Trade.find(params[:id]).destroy
  end

  # string parameter validation
  def trade_param
    params.require(:trade).permit(:trader_name, :action_name, :quantity, :price)
  end

  def autocomplete_trader
    if params[:term]
      @auto_traders = Trader.suggest(params[:term])
    end

    respond_to do |format|
      format.html {render nothing: true}
      format.json {render :json => @auto_traders.to_json}
    end
  end

  def autocomplete_action
    if params[:term]
      @auto_action = Action.suggest(params[:term])
    end

    respond_to do |format|
      format.html {render nothing: true}
      format.json {render :json => @auto_action.to_json}
    end
  end

end
