class FbMetatagObserver < ActiveRecord::Observer
	observe Refinery::Metatag
	mode=self.fb_metatag
	def after_create(model)
		Fb_Metatag.add_og_properties_to_model(model)
      	Fb_Metatag.generate_migration(model) 
	end


	def after_destroy(model)
		puts self.model_name
		#remove attributes to model
		# generate migration to drop column
	end
end
