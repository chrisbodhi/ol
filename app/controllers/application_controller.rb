class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

    def render_404
      render :json => {
        status: "404",
        title: "ID Not Found",
        detail: "Record with ID ##{params[:id]} not found in this database."
      }, :status => 404
    end
end
