require 'rails_helper'

RSpec.describe "Staffs::FixedAssets", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/staffs/fixed_assets/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/staffs/fixed_assets/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/staffs/fixed_assets/show"
      expect(response).to have_http_status(:success)
    end
  end
end
