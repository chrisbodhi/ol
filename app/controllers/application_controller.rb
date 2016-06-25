class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

    def render_404
      errorMessage = params[:id].nil? ? 'Error with your request -- sorry!' : "ID ##{params[:id]} not found in this database."
      render :json => {
        status: 404,
        error: errorMessage
      }, :status => 404
    end
end
