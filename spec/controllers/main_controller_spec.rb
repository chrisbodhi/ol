require 'rails_helper'

RSpec.describe MainController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index, format: :json

      expect(response).to have_http_status(:success)
    end

    it 'returns JSON-formatted text' do
      get :index, format: :json

      expect(response.headers['Content-Type']).to match 'application/json'
    end

    it 'returns one key-value pair' do
      get :index, format: :json

      expect(JSON.parse(response.body).length).to be 1
    end
  end

end
