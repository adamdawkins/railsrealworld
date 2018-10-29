Given("I do not have an account") do
end

When("I create an account with username {string}, email {string}, and password {string}") do |username, email, password|
  visit "/registration"
  fill_in "email", with: email
  fill_in "password", with: password
  fill_in "username", with: username

  find('input[name="commit"]').click
end

Then("I have an account") do
  expect(User.first.present?).to eq true
end

