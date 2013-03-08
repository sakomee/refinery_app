module Refinery
  module FbMetatags
    class FbMetatag < Refinery::Core::BaseModel
      self.table_name = 'refinery_fb_metatags'

      attr_accessible :model_name, :og_image_id, :og_title, :og_type, :article_tag, :article_author, :og_description, :og_attribute,:position

      acts_as_indexed :fields => [:model_name, :og_image_id, :og_title, :og_type, :article_tag, :article_author, :og_description, :og_attribute]

      validates :model_name, :presence => true, :uniqueness => true

      belongs_to :og_image, :class_name => '::Refinery::Image'
    end
  end
end
