require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "relations" do
    it { is_expected.to belong_to(:author) }
  end

  describe "validation" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:body) }
  end
end
