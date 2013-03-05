require 'refinery/fb_metatags'
module Fb_Metatag
	#Add attributes to models which require facebook metadata
	def self.add_og_properties_to_model(model)  
		model.camelize.constantize.class_eval do   
            attr_accissible :og_title, :og_description, :og_image, :og_type, :article_tag, :article_author
	 	end
	end 

    #Migration generators for models which require facebook metadata
    def self.generate_migration(model)
    	model.gsub! /\//, '_'
    	require 'rails/generators'
    	if(!model.nil?)
    		migration_name="add_og_properties_to_"+model
    		Rails::Generators.invoke("active_record:migration",[migration_name, "og_image:string", "og_title:string", "og_type:string", "og_url:string"])	
    	end
    end
end
