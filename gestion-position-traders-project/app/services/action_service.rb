class ActionService
  def add_action(name)
    Action.create(:name => name)
  end

  def find_all()
    Action.all()
  end

  def find_by_name(name)
    Action.find_by(:name => name)
  end

  def update_action(action)
    action.save()
  end

  def delete_action(action)
    if action.is_a? Action
      action.destroy
    elsif action.is_a? Integer
      model = Action.find action
      if !model.nil?
        model.destroy
      end #else raise error
    end
  end


end