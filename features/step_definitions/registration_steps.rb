Given("I do not have an account") do
end

When("I create an account with username {string}, email {string}, and password {string}") do |username, email, password|
  User.create(username: username, email: email, password: password)
end

Then("I have an account") do
  expect(User.first.present?).to eq true
end

