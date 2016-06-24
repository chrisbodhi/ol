module Api
  module V1
    class BusinessesController < ApplicationController
      def index
        @businesses = Business.paginate(:page => params[:page], :per_page => 50)

        render json: @businesses
      end

      def show
        @business = Business.find(params[:id])

        render json: @business
      end

    end
  end
end
