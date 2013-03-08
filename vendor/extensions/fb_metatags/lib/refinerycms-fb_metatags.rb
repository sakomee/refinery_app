require 'refinery/fb_metatags'
module Fb_Metatag
    # model=name of model that needs to have open graph meta tag
    # attributes=open graph properties that we want to add
    # option= option to generate migration. i.e. add OR remove  
    # 
	  def self.add_fb_metatag(model_name, attributes)
        Fb_Metatag.add_properties_to_model(model_name, attributes)
        model_name.gsub! /\//, '_'
        attributes=attributes.split(',')
        migration_name="add_og_properties_to_"+model_name
        migration_return=Fb_Metatag.generate_migration(migration_name, attributes)
        Fb_Metatag.run_migration(migration_return, :up)
    end

    def self.remove_fb_metatag(model_name, attributes)
        model_name.gsub! /\//, '_'
        attributes=attributes.split(',')
        migration_name="remove_og_properties_from_"+model_name
        migration_return=Fb_Metatag.generate_migration(migration_name, attributes)
        Fb_Metatag.run_migration(migration_return, :up)
    end  

    #Add attributes to models 
	def self.add_properties_to_model(model, attributes)  
       model.gsub! /_/, '/'
	   model.camelize.constantize.class_eval do   
            attr_accessible "#{attributes}"	 	
       end
	end 

    #Migration generators for models which require facebook metadata   
    def self.generate_migration(migration_name, attributes)        
    	require 'rails/generators'
    	if(!migration_name.nil?)
    		result=Rails::Generators.invoke("active_record:migration",[migration_name, attributes]) 
    	end
    end
    
    #Migration generators for models which require facebook metadata
    def self.run_migration(migration_return,change)
        if(!migration_return.nil?)
           require "#{migration_return.last}"           
           migration_return.first.camelize.constantize.migrate("#{change}")
        end
    end   
end
