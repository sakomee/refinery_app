# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "FbMetatags" do
    describe "Admin" do
      describe "fb_metatags" do
        login_refinery_user

        describe "fb_metatags list" do
          before do
            FactoryGirl.create(:fb_metatag, :model_name => "UniqueTitleOne")
            FactoryGirl.create(:fb_metatag, :model_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.fb_metatags_admin_fb_metatags_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.fb_metatags_admin_fb_metatags_path

            click_link "Add New Fb Metatag"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Model Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::FbMetatags::FbMetatag.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Model Name can't be blank")
              Refinery::FbMetatags::FbMetatag.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:fb_metatag, :model_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.fb_metatags_admin_fb_metatags_path

              click_link "Add New Fb Metatag"

              fill_in "Model Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::FbMetatags::FbMetatag.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:fb_metatag, :model_name => "A model_name") }

          it "should succeed" do
            visit refinery.fb_metatags_admin_fb_metatags_path

            within ".actions" do
              click_link "Edit this fb metatag"
            end

            fill_in "Model Name", :with => "A different model_name"
            click_button "Save"

            page.should have_content("'A different model_name' was successfully updated.")
            page.should have_no_content("A model_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:fb_metatag, :model_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.fb_metatags_admin_fb_metatags_path

            click_link "Remove this fb metatag forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::FbMetatags::FbMetatag.count.should == 0
          end
        end

      end
    end
  end
end
