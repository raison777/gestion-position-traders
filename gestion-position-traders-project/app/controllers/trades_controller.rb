class TradesController < ApplicationController
  def new
  end

  def create
  end

  def delete
    params.require(:id)
    trades_service = TradeService.new
    trades_service.delete_trade params[:id]
  end
end
