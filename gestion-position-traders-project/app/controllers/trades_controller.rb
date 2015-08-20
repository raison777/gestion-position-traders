# encoding: utf-8
class TradesController < ApplicationController
  # listing
  def index
    @trades = Trade.all.joins(:trader, :action).reorder(:id).pluck(:id, :date, :quantity, :price, 'traders.name as trader_name', 'actions.name as action_name').map{|t| {:id=>t[0], :date=>t[1], :quantity=>t[2], :price=>t[3],:trader_name=>t[4], :action_name=>t[5]}}
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
      Trade.create!(:date=> DateTime.current, :quantity => trade_form.quantity,
                    :action_id => action.id, :trader_id => trader.id, :price => trade_form.price)
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
end
