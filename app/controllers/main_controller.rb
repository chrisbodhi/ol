class MainController < ApplicationController
  def index
    businesses_url = "http://#{request.server_name}:#{request.port}/api/businesses\{/business_id\}"
    urls_obj = { "businesses_url": businesses_url }

    render :json => JSON.pretty_generate(urls_obj)
  end
end
