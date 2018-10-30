When("I go to the user's profile") do
  visit "/profile/#{@user.id}"
end

Then("I should see {int} articles") do |count|
  expect(page).to have_selector('.article-preview', count: count)
end
