Then("I should be at {string}") do |path|
  expect(current_path).to eq path
end

