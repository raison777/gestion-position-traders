require 'rails_helper'

RSpec.describe TradersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #show" do
    it "returns http success" do
      get :index, {:id => 10005}
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  pending "GET #delete" do
    it "returns http success" do
      get :list
      expect(response).to have_http_status(:success)
    end
  end
end
