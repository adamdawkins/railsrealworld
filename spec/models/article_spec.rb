require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "relations" do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to have_many(:taggings) }
    it { is_expected.to have_many(:tags).through(:taggings) }
    it { is_expected.to have_many(:favouritings) }
    it { is_expected.to have_many(:fans).through(:favouritings) }
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

  describe "#tag_list" do
    before do
      Tag.create(name: 'food')
    end
    it "finds existing tags and assigns them" do
      expect(FactoryBot.create(:article, tag_list: 'food').tags.first.name).to eq 'food'
    end
    it "creates a tag if it doesn't exist" do
      FactoryBot.create(:article, tag_list: 'food, cooking')
      expect(Tag.find_by_name('cooking')).to be_a Tag
    end
  end

  describe "self.tagged_with" do
    it "returns only the articles tagged with that tag" do
      5.times { FactoryBot.create(:article) }
      5.times { FactoryBot.create(:article, tag_list: 'food') }
      expect(Article.tagged_with('food').size).to eq 5
    end
  end
end
