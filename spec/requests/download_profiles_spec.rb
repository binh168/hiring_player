require "rails_helper"

RSpec.describe "DownloadProfiles", type: :request do
  let(:user) { create(:user) }
  let(:params){{from: "2020-10-9", to: "2020-15-09"}}

  before(:each) do
    log_in_as user
  end

  describe "GET /download_profiles" do
    it "downloads file zip" do
      get "/download_profiles.csv", params: params
      expect(response.content_type).to eq("application/zip")
    end
  end
end
