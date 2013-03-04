require 'spec_helper'

module Refinery
  module FbMetatags
    describe FbMetatag do
      describe "validations" do
        subject do
          FactoryGirl.create(:fb_metatag,
          :model_name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:model_name) { should == "Refinery CMS" }
      end
    end
  end
end
