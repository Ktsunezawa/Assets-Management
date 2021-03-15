require 'rails_helper'

RSpec.describe "Staffs::Requests", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/staffs/requests/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/staffs/requests/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
