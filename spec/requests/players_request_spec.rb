require "rails_helper"

RSpec.describe "Players", type: :request do
  let(:user) { create(:user) }
  let(:game) { create(:game)}
  let(:rank) { create(:rank, game: game)}
  let(:other_game) { create(:game)}
  let(:other_rank) { create(:rank, game: other_game)}
  let(:player_params) do
    {
      game_id: game.id,
      rank_id: rank.id
    }
  end
  let(:new_player_params) do
    {
      game_id: other_game.id,
      rank_id: other_rank.id
    }
  end
  let(:player) {Player.create user_id: user.id, game_id: game.id, rank_id: rank.id}

  before(:each) do
    log_in_as user
  end

  describe "GET players#index" do
    it "should get index" do
      get players_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST player#create" do
    it "creates player with valid attributes" do
      expect {post "/players", params: player_params}
        .to change{Player.count}.by(1)
    end
  end

  describe "PUT player#update" do
    it "updates player" do
      put "/players/#{player.id}", params: new_player_params
      expect(flash[:success]).to be_present
    end
  end

  describe "DELETE player#destroy" do
    it "deletes player" do
      delete "/players/#{player.id}"
      expect(flash[:success]).to be_present
    end
  end
end
