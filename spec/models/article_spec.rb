require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "relations" do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to have_many(:taggings) }
    it { is_expected.to have_many(:tags).through(:taggings) }
  end

  describe "validation" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:body) }
  end

  it "has a per_page of 20" do
    expect(Article.per_page).to eq 20
  end
end
