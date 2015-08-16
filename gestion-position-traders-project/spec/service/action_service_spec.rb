require 'rails_helper'

describe ActionService do

  before(:all) do
    @default_action_name = 'defaultTestAction'
    @action_service = ActionService.new()
    Action.create(:name => @default_action_name)
  end

  it 'persist an action object in DB' do
    result = @action_service.save_action(Action.new(:name=>'RspecAction'))
    expect(result).to_not be_nil
  end

  it 'select all actions from DB' do
    result = @action_service.find_all()
    expect(result).to_not be_blank
  end

  it 'select one action from DB with his name' do
    result = @action_service.find_by_name(@default_action_name)
    expect(result.name).to eq(@default_action_name)
  end

  it 'select the test action and rename it, twice' do
    upd_name = 'updatedTestAction'

    result = @action_service.find_by_name(@default_action_name)
    expect(result.name).to eq(@default_action_name)
    result.name = upd_name
    updatedResult = @action_service.save_action result
    expect(updatedResult).to be_truthy
    result = @action_service.find_by_name(upd_name)
    expect(result.name).to eq(upd_name)
    result.name = @default_action_name
    updatedResult = @action_service.save_action result
    expect(updatedResult).to be_truthy
  end
end
