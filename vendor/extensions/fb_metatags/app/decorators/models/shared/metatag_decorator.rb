if ActiveRecord::Base.connection.table_exists? 'refinery_fb_metatags'
	models=Refinery::FbMetatags::FbMetatag.all
	models.each do |model|
		attributes=model.og_attribute
		attributes=attributes.split(',')
		model_name=model.model_name
		model_name.gsub! /_/, '/'
		model_name.camelize.constantize.class_eval do
			attr_accessible  :og_image_id, :og_title, :og_type, :article_tag, :article_author, :og_description
		end
	end
end