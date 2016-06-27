module Api
  module V1
    class BusinessesController < ApplicationController
      def index
        @businesses = Business.paginate(
          :page => params[:page],
          :per_page => set_per_page()
        )
        @withMeta = {
          :current_page => @businesses.current_page,
          :per_page => @businesses.per_page,
          :total_entries => @businesses.total_entries,
          :businesses => @businesses
        }

        render_it(@withMeta, params[:pretty])
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

      def set_per_page()
        per_page = 50
        if (params[:per_page] && params[:per_page] > 100)
          per_page = 100
        elsif params[:per_page]
          per_page = params[:per_page]
        end
        return per_page
      end
    end
  end
end
