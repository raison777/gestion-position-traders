class ActionService
  def add_action(action)
    action.save
  end

  def find_all()
    Action.all()
  end

  def find_by_name(name)
    result = Action.find_by(:name => name)
    if(result.nil?)
      #raise Exception
    end
    return result
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

  def create_action_with_array(array)
    p array
    if array[:name].nil?
      #raise newException + validation plus poussée (par champs)
    end
    Action.new(:name => array[:name])
  end
end