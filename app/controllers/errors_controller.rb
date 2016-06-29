class ErrorsController < ApplicationController
  def render_404
    render :json => {
      status: "404",
      title: "Page Not Found",
      detail: "No page exists at this route."
    }, :status => 404
  end
end
