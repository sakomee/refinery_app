module Refinery
  module FbMetatags
    module Admin
      class FbMetatagsController < ::Refinery::AdminController

        crudify :'refinery/fb_metatags/fb_metatag',
                :title_attribute => 'model_name', :xhr_paging => true

      end
    end
  end
end
