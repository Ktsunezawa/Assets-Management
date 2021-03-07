require 'rails_helper'

RSpec.describe "Staffs::Classifications", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/staffs/classifications/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/staffs/classifications/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/staffs/classifications/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
