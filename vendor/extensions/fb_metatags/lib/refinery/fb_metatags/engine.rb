#output.last.scan(/migrate\/(.*)_add_og_properties_to_refinery_blog_post.rb/)[0][0]
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

      config.to_prepare do  
        Refinery::FbMetatags::Admin::FbMetatagsController.class_eval do
          before_filter :generate_fb_metatags, :only => [:create, :update, :destroy ]
          def generate_fb_metatags              
            if(action_name=='create')
              attributes=params[:fb_metatag][:og_attribute]
              param= params[:fb_metatag]            
              model_name=param[:model_name]           
              Fb_Metatag.add_fb_metatag(model_name, attributes)
            elsif (action_name=='update') 
              attributes=params[:fb_metatag][:og_attribute]           
              model_name1=@fb_metatag.model_name
              model_name2=params[:fb_metatag][:model_name]
              if (model_name1!=model_name2)             
                Fb_Metatag.remove_fb_metatag(model_name1, attributes)             
                Fb_Metatag.add_fb_metatag(model_name2, attributes)
              end
            else
              model_name=@fb_metatag.model_name
              attributes=@fb_metatag.og_attribute
              Fb_Metatag.remove_fb_metatag(model_name, attributes)   
            end              
          end
        end
      end
    end
  end
end
