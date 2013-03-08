module Refinery
  class FbMetatagsGenerator < Rails::Generators::Base

    def rake_db
      rake("refinery_fb_metatags:install:migrations")
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

        # Added by Refinery CMS Fb Metatags extension
        Refinery::FbMetatags::Engine.load_seed
                EOH
      end
    end

    source_root File.expand_path('../../../../', __FILE__)
    
    def Copy_files
      #copy_file 'app/views/refinery/blog/admin/posts/_form.html.erb'  
      #copy_file 'app/views/refinery/_head.html.erb'  
      #copy_file 'app/views/shared/_fb_metatag.html.erb' 
      #copy_file 'app/views/_head_fb_metatag.html.erb'
      #copy_file 'app/models/fb_metatag_observer.rb'  
    end

    def create_initializer_file
      # puts "  Updating active_record.observers in application.rb"
      # application "config.active_record.observers = :fb_metatag_observer"
    end
  end
end
