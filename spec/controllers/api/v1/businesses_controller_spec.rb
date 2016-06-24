require 'rails_helper'
require 'will_paginate'

describe Api::V1::BusinessesController do
  describe 'GET #index for API' do
    it 'returns JSON-formatted content' do
      get :index, format: :json

      expect(response.headers['Content-Type']).to match 'application/json'
    end

    it 'returns a maximum of fifty entries per page' do
      51.times{ create(:business) }
      get :index, format: :json

      expect(JSON.parse(response.body).length).to be <= 50
    end
  end

  describe 'GET #show for API' do
    it 'returns JSON-formatted content' do
      business = create(:business)
      get :show, id: business.id

      expect(response.headers['Content-Type']).to match 'application/json'
    end

    it 'returns a single entry' do
      business = create(:business)
      get :show, id: business.id
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json['uuid']).to eq business.uuid
      expect(json['name']).to eq business.name
      expect(json['website']).to eq business.website
    end
  end
end
