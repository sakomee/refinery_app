namespace :refinery do

  namespace :fb_metatags do

   # call this task by running: rake refinery:fb_metatags:my_task
    desc "Description of my task below"
    task :my_task => :environment do
    Fb_Metatag.generate_migration(model_name,attributes)
     print "success"
    end

  end

end