require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  login_user

  let(:valid_attributes) {
      {
        :description => "This is a test description",
        :user_id => 1
      }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
      it "returns a success response" do
          Post.create! valid_attributes
          get :index, params: {}, session: valid_session
          expect(response).to be_successful # be_successful expects a HTTP Status code of 200
          # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
      end
  end


  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end


  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
