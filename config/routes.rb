require 'api_constraints'

Rails.application.routes.draw do
  root 'main#index'

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :businesses, only: [:index, :show]
    end
  end

  get '*not_found', to: 'errors#render_404'
end
