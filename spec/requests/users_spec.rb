require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /new ' do
    it 'returns http success' do
      get new_user_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create ' do
    before do
      post users_path, params: { 'user' => { username: 'first_user', password: 'password', password_confirmation: 'password' } }
    end

    it 'returns http redirect' do
      expect(response).to have_http_status(302)
    end

    it "returns a response, 'You are successfully signed Up.'" do
      post users_path, params: { 'user' => { username: 'first_user', password: 'password', password_confirmation: 'password' } }
      expect(response.body).to include 'You are successfully signed Up.'
    end
  end
end
