module Refinery
  module FbMetatags
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::FbMetatags

      engine_name :refinery_fb_metatags

      initializer "register refinerycms_fb_metatags plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "fb_metatags"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.fb_metatags_admin_fb_metatags_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/fb_metatags/fb_metatag',
            :title => 'model_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::FbMetatags)
      end
    end
  end
end
