require 'rails_helper'
require 'will_paginate'

describe Api::V1::BusinessesController do
  describe 'GET #index for API' do
    it 'returns JSON-formatted content' do
      get :index, format: :json

      expect(response.headers['Content-Type']).to match 'application/json'
    end

    it 'returns fifty entries per page by default' do
      51.times{ create(:business) }
      get :index, format: :json

      expect(JSON.parse(response.body)['businesses'].length).to eq 50
    end

    it 'can return a user-specified number of entries per page' do
      51.times{ create(:business) }
      perPage = 20
      get :index, format: :json, per_page: perPage
      json = JSON.parse(response.body)

      expect(json['businesses'].length).to eq perPage
      expect(json['per_page']).to eq perPage
    end

    it 'can return up to 100 entries per page' do
      101.times{ create(:business) }
      perPage = 150
      max = 100
      get :index, format: :json, per_page: perPage
      json = JSON.parse(response.body)

      expect(json['businesses'].length).to eq max
      expect(json['per_page']).to eq max
    end

    it 'returns an empty array for pages requested outside the range of available data' do
      create(:business)
      pageId = 2
      get :index, format: :json, page: pageId
      expect(JSON.parse(response.body)['businesses']).to eq []
    end

    it 'returns metadata about the current page, total entries, and amount per page' do
      51.times{ create(:business) }
      get :index, format: :json
      json = JSON.parse(response.body)

      expect(json['current_page']).to eq 1
      expect(json['per_page']).to eq 50
      expect(json['total_entries']).to eq 51
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

    it 'returns JSON for IDs that do not exist' do
      get :show, id: 111111

      expect(response.headers['Content-Type']).to match 'application/json'
    end

    it 'states that there is no entry in the database for IDs that do not exist' do
      id = 111111
      get :show, id: id

      expect(response.status).to be 404
      expect(JSON.parse(response.body)['detail']).to include id.to_s
    end
  end
end
