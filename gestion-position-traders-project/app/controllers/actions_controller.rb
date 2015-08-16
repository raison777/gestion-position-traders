# encoding: utf-8
class ActionsController < ApplicationController

  def initialize
    super()
    @action_service = ActionService.new
  end

  # default listing action
  def index
    @actions = @action_service.find_all
  end

  # detail action
  def show
    render :file => 'notImplemented.html.erb'
  end

  # edition action
  def edit
    render :file => 'notImplemented.html.erb'
  end

  # fired when submitting edit form
  def update
    render :file => 'notImplemented.html.erb'
  end

  # creation form
  def new
  end

  # creation action
  def create
    action = Action.new(action_param)
    if(action.valid?)
      @action_service.save_action action
      flash[:success] = 'La nouvelle action a été sauvegardée avec succès".'
    else
      flash[:error] = 'Les données fournies sont incorrectes.'
    end
    redirect_to action: :new
  end

  # destruction call
  def destroy
    params.require(:id)
    begin
    @action_service.delete_action params[:id]
    rescue => e
      p e.message
    end
  end

  # strong parameter validation for action
  def action_param
    params.require(:act_item).permit(:id, :name)
  end
end
