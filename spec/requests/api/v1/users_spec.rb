# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  let(:user) { create(:user) }
  let(:users) { create_list(:user, 10) }

  describe 'GET /api/v1/users' do
    before { get '/api/v1/users' }

    it 'returns user' do
      expect(json).not_to be_empty
      expect(users).to include(json['data'])
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /api/v1/user/like' do
    before { post '/api/v1/user/like' }

    it 'increases the liked user count' do
      pending 'add the test later'
    end
  end

  describe 'POST /api/v1/user/pass' do
    before { post '/api/v1/user/pass' }

    it 'increases the passd user count' do
      pending 'add the test later'
    end
  end

  describe 'GET /api/v1/user/liked_list' do
    before { get '/api/v1/user/liked_list' }

    it 'returns favoriting list' do
      pending 'add the test later'
    end
  end

  describe 'GET /api/v1/user/passed_list' do
    before { get '/api/v1/user/passed_list' }

    it 'return passing list' do
      pending 'add the test later'
    end
  end
end
