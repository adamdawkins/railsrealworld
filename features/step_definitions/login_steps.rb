Given("I am not logged in") do
  @me = nil
end

Given("I am logged in") do
  @me = User.create(username: 'adam', email: 'adam@dragondrop.uk', password: 'password')
end
