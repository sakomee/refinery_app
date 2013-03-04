class CreateFbMetatagsFbMetatags < ActiveRecord::Migration

  def up
    create_table :refinery_fb_metatags do |t|
      t.string :model_name
      t.string :og_title
      t.string :og_type
      t.string :og_url
      t.integer :og_image_id
      t.string :og_site_name
      t.text :og_description
      t.string :fb_app_id
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
