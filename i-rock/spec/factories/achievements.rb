FactoryGirl.define do
  factory :achievement do
    #title "Title"
    sequence(:title) {|n| "Achievement #{n}"}
    description "description"
    # privacy Achievement.privacies[:private_access]
    featured false
    cover_image "some_file.png"

    factory :public_achievement do
      # privacy Achievement.privacies[:public_access]
      privacy :public_access
    end
    factory :private_achievement do
      privacy :private_access
    end
  end
end
