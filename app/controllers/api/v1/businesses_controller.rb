require 'json'

module Api
  module V1
    class BusinessesController < ApplicationController
      def index
        @businesses = Business.paginate(:page => params[:page], :per_page => 50)

        render_it(@businesses, params[:pretty])
      end

      def show
        @business = Business.find(params[:id])
        render_it(@business, params[:pretty])
      end

      private

      def pretty_json(obj)
        JSON.pretty_generate(JSON.parse(obj.to_json))
      end

      def render_it(obj, check)
        if check
          render json: pretty_json(obj)
        else
          render json: obj
        end
      end
    end
  end
end
