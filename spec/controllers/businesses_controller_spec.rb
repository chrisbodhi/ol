require 'rails_helper'

describe BusinessesController do
  describe 'GET #index' do
    it 'returns JSON-formatted content' do
      get :index, format: :json
      expect(response.headers['Content-Type']).to match 'application/json'
    end
  end
end
