# encoding: utf-8
class TradersController < ApplicationController


  # listing all traders with agreggate sum of sold trades
  def index
    @lines = Trader.all.map{|t| {:id => t.id, :name => t.name, :aggregate_sum=> t.aggregate_sum}}
  end

  # provide details on one trader
  def show
    params.require(:id)
    if(params[:id].to_i > 0)
      @trader = Trader.find(params[:id].to_i)
      @sells = @trader.trades.order(:date)
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
      trader.save
      flash[:success] = 'Le trader a été crée.'
    else
      flash[:error] = 'Les données fournies sont incorrectes.'
    end
    redirect_to action: :new
  end

  # provide form for editing
  def edit
    if(params[:id].is_a? Integer && params[:id] > 0)
      @trader = Trader.find(param[:id])
    elsif
    redirect_to action: :list
    end
  end

  # edit post
  def update
    trader = params[:trader]
    if (trader.is_a? Trader) && trader.valid?
      trader.save
    end
    redirect_to show, :id => params[:trader].id
  end

  # destruction of a trader with its id
  def destroy
    params.require(:id)
    trader = Trader.find(id)
    if(trader.valid?)
      trader.destroy
    end
    redirect_to action: :list
  end

  #strong parameters validation for trader
  def trader_param
    params.require(:trader).permit(:id, :name)
  end


  def autocomplete
    if params[:term]
      @auto_traders = Trader.select(:id, :name).where('traders.name LIKE ?', params[:term] + '%')
    end

    respond_to do |format|
      format.html {render nothing: true}
      format.json {render :json => @auto_traders.to_json}
    end
  end

end
