When("I create an article with title {string}, a description and a body") do |title|
  visit "/editor"
  fill_in "Article Title", with: title
  fill_in "article[description]", with: "You should read this article"
  fill_in "article[body]", with: "The article body, in *markdown*"

  find('input[name="commit"]').click
end

When("I create an article without a title") do
  steps %{
    When I create an article with title "", a description and a body
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
