class ActionsController < ApplicationController
  def new
    #TODO : study forms
  end

  def create
    #TODO : study forms
  end

  def delete
    params.require(:id)
    action_service = ActionService.new;
    action_service.delete_action params[:id]
  end
end
