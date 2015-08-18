# encoding: utf-8
class ActionsController < ApplicationController

  # default listing action
  def index
    @actions = Action.all
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
    p action
    if(action.valid?)
      action.save
      flash[:success] = 'La nouvelle action a été sauvegardée avec succès".'
    else
      flash[:error] = 'Les données fournies sont incorrectes.'
    end
    redirect_to action: :new
  end

  # destruction call
  def destroy
    params.require(:id)
    action = Action.find(params[:id])
    if(action.valid?)
      action.destroy
    end
  end

  # strong parameter validation for action
  def action_param
    params.require(:act_item).permit(:id, :name, :price)
  end
end
