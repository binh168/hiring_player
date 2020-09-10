require "rails_helper"

RSpec.describe "Ranks", type: :request do
  let(:user) {create(:user) }
  let(:game) {create(:game) }
  let(:rank_params) do
    {
      game: game.id,
      format: :js
    }
  end

  before(:each) do
    log_in_as user
  end

  describe "GET ranks#index" do
    it "should get index" do
      get ranks_path, params: rank_params
      expect(response).to render_template(:index)
    end
  end
end
