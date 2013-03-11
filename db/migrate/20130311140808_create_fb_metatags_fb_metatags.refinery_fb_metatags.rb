# This migration comes from refinery_fb_metatags (originally 1)
class CreateFbMetatagsFbMetatags < ActiveRecord::Migration

  def up
    create_table :refinery_fb_metatags do |t|
      #t.string :og_url
      #t.string :og_site_name
      t.string :model_name
      t.string :og_title
      t.string :og_type
      t.text   :og_description
      t.integer :og_image_id
      t.string :article_tag, default: " "
      t.string :article_author, default: "Admin"
      t.string :og_attribute, default: "og_title,og_type,og_description,article_tag,article_author"
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-fb_metatags"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/fb_metatags/fb_metatags"})
    end

    drop_table :refinery_fb_metatags

  end

end
