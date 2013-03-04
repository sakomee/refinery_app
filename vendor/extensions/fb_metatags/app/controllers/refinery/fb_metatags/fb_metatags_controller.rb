module Refinery
  module FbMetatags
    class FbMetatagsController < ::ApplicationController

      before_filter :find_all_fb_metatags
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @fb_metatag in the line below:
        present(@page)
      end

      def show
        @fb_metatag = FbMetatag.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @fb_metatag in the line below:
        present(@page)
      end

    protected

      def find_all_fb_metatags
        @fb_metatags = FbMetatag.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/fb_metatags").first
      end

    end
  end
end
