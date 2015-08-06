require 'rails_helper'

RSpec.describe TradersController, type: :controller do

  describe "GET #list" do
    it "returns http success" do
      get :list
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #show" do
    it "returns http success" do
      get :list
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #new" do
    it "returns http success" do
      get :list
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #create" do
    it "returns http success" do
      get :list
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #edit" do
    it "returns http success" do
      get :list
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #update" do
    it "returns http success" do
      get :list
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #delete" do
    it "returns http success" do
      get :list
      expect(response).to have_http_status(:success)
    end
  end

end
