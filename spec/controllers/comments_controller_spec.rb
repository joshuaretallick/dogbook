require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'GET /new ' do
    xit 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end


  describe 'POST /' do
    xit 'responds with 200' do
      post :create, params: { comment: { body: 'Hello, world!' } }
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /' do
    xit 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
