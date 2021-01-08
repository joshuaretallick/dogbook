# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { comment: { body: 'Hello, world!' } }
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
