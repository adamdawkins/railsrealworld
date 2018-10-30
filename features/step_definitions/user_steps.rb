When("I go to the user's profile") do
  visit user_path @user
end

When("I go to my profile") do
  visit user_path @me
end

Then("I should see {int} articles") do |count|
  expect(page).to have_selector('.article-preview', count: count)
end

