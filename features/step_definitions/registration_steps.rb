Given("I do not have an account") do
end

When("I create an account with username {string}, email {string}, and password {string}") do |username, email, password|
  visit "/register"
  fill_in "Email", with: email
  fill_in "Password", with: password
  fill_in "Username", with: username

  find('input[name="commit"]').click
end

Then("I should have an account") do
  expect(User.first.present?).to eq true
end

