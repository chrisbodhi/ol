class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404_record
  rescue_from ActionController::RoutingError, :with => :render_404_routing

  def render_404_record
    render :json => {
      status: "404",
      title: "Record Not Found",
      detail: "Record with ID ##{params[:id]} not found in this database.",
    }, :status => 404
  end

  def render_404_routing
    render :json => {
      status: "404",
      title: "Route Not Found",
      detail: "There isn't anything here. Not even dragons.",
    }, :status => 404
  end
end
