module Api
  module V1
    class BusinessesController < ApplicationController
      before_filter :check_token

      def index
        @businesses = Business.paginate(
          :page => params[:page],
          :per_page => set_per_page
        )

        @links = {
          self: "http://#{request.server_name}:#{request.port}/api/businesses?page=#{@businesses.current_page}",
          first: "http://#{request.server_name}:#{request.port}/api/businesses?page=1",
          last: "http://#{request.server_name}:#{request.port}/api/businesses?page=#{@businesses.total_pages}"
        }

        # Add pagination details in the headers so as to provide options to API consumers
        # Options -- a great part of the Ruby tradition!
        add_links

        @withMeta = {
          :current_page => @businesses.current_page,
          :per_page => @businesses.per_page,
          :total_entries => @businesses.total_entries,
          :links => @links,
          :businesses => @businesses
        }

        render_it(@withMeta, params[:pretty])
      end

      def show
        @business = Business.find(params[:id])
        render_it(@business, params[:pretty])
      end

      private

      def check_token
        unless request.headers['TOKEN']
          head :unauthorized
          return
        end

        if request.headers['TOKEN'] != 'right'
          head :forbidden
          return
        end

        # continue
      end

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

      def set_per_page
        default_per_page = 50
        if (params[:per_page] && params[:per_page].to_i > 100)
          return 100
        elsif (params[:per_page] && params[:per_page].to_i <= 0)
          return default_per_page
        elsif params[:per_page]
          return params[:per_page]
        else
          return default_per_page
        end
      end

      # Update the response header and metadata object in one pass
      def add_links
        link_root = "<http://#{request.server_name}:#{request.port}/api/businesses?page="
        response.headers['Link'] = "#{link_root}1>; rel='first', #{link_root}#{@businesses.total_pages}>; rel='last'"

        if @businesses.next_page
          response.headers['Link'] << ", #{link_root}#{@businesses.next_page}>; rel='next'"
          @links['next'] = "#{link_root}#{@businesses.next_page}"
        end

        if @businesses.previous_page
          response.headers['Link'] << ", <#{link_root}#{@businesses.previous_page}>; rel='prev'"
          @links['prev'] = "#{link_root}#{@businesses.previous_page}"
        end
      end
    end
  end
end
