# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user) { users.first }
  let(:someone) { create(:user, id: 11) }
  let!(:favoriting) { user.like(someone) }
  let!(:favourites) { someone.like(user) }

  describe 'GET /api/v1/users' do
    before { get '/api/v1/users' }

    it 'returns user' do
      expect(json).not_to be_empty
      expect(users.pluck(:id)).to include(json['id'])
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /api/v1/user/like' do
    before { post '/api/v1/user/like' }

    it 'increases favoriting list by 1' do
      expect(user.favoriting.size).to eq 2
    end

    it 'returns http success' do
      expect(json['message']).to eq 'success'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /api/v1/user/pass' do
    before { post '/api/v1/user/pass' }

    it 'increases passing list by 1' do
      expect(user.passing.size).to eq 1
    end

    it 'returns http success' do
      expect(json['message']).to eq 'success'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /api/v1/user/favoriting' do
    before { get '/api/v1/user/favoriting' }

    it 'returns favoriting list' do
      expect(json).not_to be_empty
      expect(json.size).to eq user.favoriting.size
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /api/v1/user/matching' do
    before { get '/api/v1/user/matching' }

    it 'returns matching list' do
      matching = user.favoriting & user.favourites
      expect(json).not_to be_empty
      expect(json.first['id']).to eq matching.pick(:id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
