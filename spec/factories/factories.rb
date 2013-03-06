FactoryGirl.define do
  factory :organization do
    name { Forgery(:name).company_name }
  end

  factory :user do
    name "Steve"
  end


end