require 'rails_helper'

RSpec.describe "Managers::Staffs", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/managers/staffs/index"
      expect(response).to have_http_status(:success)
    end
  end

end
