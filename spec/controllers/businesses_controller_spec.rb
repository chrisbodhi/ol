require 'rails_helper'

describe BusinessesController do
  describe 'GET #index' do
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
end
