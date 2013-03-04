module Refinery
  module FbMetatags
    class FbMetatag < Refinery::Core::BaseModel
      self.table_name = 'refinery_fb_metatags'

      attr_accessible :model_name, :og_title, :og_type, :og_url, :og_image_id, :og_site_name, :og_description, :fb_app_id, :position

      acts_as_indexed :fields => [:model_name, :og_title, :og_type, :og_url, :og_site_name, :og_description, :fb_app_id]

      validates :model_name, :presence => true, :uniqueness => true

      belongs_to :og_image, :class_name => '::Refinery::Image'
    end
  end
end
