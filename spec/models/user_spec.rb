require_relative '../rails_helper'
require_relative '../../app/models/user'

RSpec.describe User, type: :model do
  describe "relations" do
    it { is_expected.to have_many(:articles) }
  end
  it "has secure password" do
    user = User.new

    expect(user.respond_to? :password).to eq true
    expect(user.respond_to? :password_digest).to eq true
    expect(user.respond_to? :authenticate).to eq true
  end

  it { is_expected.to validate_presence_of(:username) }
end
