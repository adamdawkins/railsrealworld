Given ("I have created an article with title {string}") do |title|
  @article = Article.create({
    title: title,
    description: "You should read this article",
    body: "The article body, in *markdown*",
    author: @me
  })
end

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

When("I go to edit the article") do
  visit edit_article_path(@article)
end

When("I update the title of the article to {string}") do |title|
  fill_in "article[title]", with: title
  find('input[name="commit"]').click
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
