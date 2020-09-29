require "rails_helper"
RSpec.describe OmniauthCallbacksController, type: :controller do
  before(:each) do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "#facebook" do
    context "Success handling" do
      before(:each) do
        request.env["omniauth.auth"] = FactoryBot.create(:auth_hash, :facebook)
        get :facebook
      end

      let(:user) { User.find_by email: "testuser@facebook.com" }

      it "should set current_user to proper user" do
        expect(subject.current_user).to eq(user)
      end
    end

    context "Non-persisting User" do
      before(:each) do
        request.env["omniauth.auth"] = FactoryBot.create(
            :auth_hash, :facebook, :does_not_persist
        )
        get :facebook
      end
      it "should redirect to new user registration" do
        expect(response).to redirect_to signup_path
      end
    end
  end

  describe "#google" do
    context "Success handling" do
      before(:each) do
        request.env["omniauth.auth"] = create(:auth_hash, :google)
        get :google_oauth2
      end

      let(:user) { User.find_by(email: "testuser@gmail.com") }

      it "should set current_user to proper user" do
        expect(subject.current_user).to eq(user)
      end
    end

    context "Non-persisting User" do
      before(:each) do
        request.env["omniauth.auth"] = FactoryBot.create(
            :auth_hash, :google, :does_not_persist
        )
        get :google_oauth2
      end
      it "should redirect to new user registration" do
        expect(response).to redirect_to signup_path
      end
    end
  end

  describe "#failure" do
    after(:each) do
      Rails.application.reload_routes!
    end

    before(:each) do
      Rails.application.routes.draw do
        devise_scope :user do
          get "/users/auth/failure" => "omniauth_callbacks#failure"
        end
        root "static_pages#home"
      end
      get :failure
    end

    it "should redirect to root_path" do
      expect(response).to redirect_to root_path
    end
  end
end
