FactoryBot.define do
  factory :article do
    title { "This is a title" }
    description { "This is a description" }
    body { "This is a body" }
    association :author, factory: :user, strategy: :build
  end
end
