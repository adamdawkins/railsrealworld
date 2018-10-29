When("I create an article with title {string}, a description and a body") do |title|
  Article.create(
    author: @me,
    title: title,
    description: "You should read this article",
    body: "The article body, in *markdown*"
  )
end

When("I create an article without a title") do
  steps %{
    I create an article with title "", a description and a body
  }
end

Then("an article with title {string} should exist") do |title|
  expect(Article.find_by_title(title).present?).to eq true
end

Then("an article with title {string} should not exist") do |title|
  expect(Article.find_by_title(title).present?).to eq false
end

Then("an article should not be created") do
  expect(Article.first.present?).to eq false
end
