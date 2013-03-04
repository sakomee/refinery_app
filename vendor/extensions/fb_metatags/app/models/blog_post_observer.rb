class FbMetatagObserver < ActiveRecord::Observer
	observe Refinery::Metatag
	def after_create(model)
		puts self.model_name
		self.class_eval do
			attr_accissible :og_title, :og_description, :og_image, :og_type, :article_tag, :article_author
		end
		#generate migration add column
	end
	def after_destroy(model)
		puts self.model_name
		#remove attributes to model
		# generate migration to drop column
	end
end
