require 'rails_helper'

RSpec.describe "Managers::FixedAssets", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/managers/fixed_assets/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/managers/fixed_assets/show"
      expect(response).to have_http_status(:success)
    end
  end

end
