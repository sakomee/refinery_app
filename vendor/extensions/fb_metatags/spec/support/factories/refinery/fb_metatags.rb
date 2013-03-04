
FactoryGirl.define do
  factory :fb_metatag, :class => Refinery::FbMetatags::FbMetatag do
    sequence(:model_name) { |n| "refinery#{n}" }
  end
end

