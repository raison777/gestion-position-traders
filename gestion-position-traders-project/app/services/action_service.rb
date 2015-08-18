class ActionService
  def save_action(action)
    action.save
  end

  def find_all()
    Action.all()
  end

  def find_by_name(name)
    result = Action.find_by(:name => name)
    raise ActionNotFoundError, "No action has be found for the name #{name}" if result.nil?
    return result
  end

  def delete_action(action)
    if(action.is_a? Integer)
      action_to_be_destroy = Action.find(action)
      raise ActionNotFoundError, 'Action you are trying to destroy does not exist' if action_to_be_destroy.nil?
      action_to_be_destroy.destroy
    elsif action.is_a? Action
      action.destroy
    end
  end

  def suggest term
  end

  deprecate :save_action, :find_all, :find_by_name, :delete_action, :suggest
end