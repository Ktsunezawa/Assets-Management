require 'rails_helper'

RSpec.describe "Staffs::Bases", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/staffs/bases/index"
      expect(response).to have_http_status(:success)
    end
  end

end
