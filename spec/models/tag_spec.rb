require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { is_expected.to have_many(:taggings) }
  it { is_expected.to have_many(:articles).through(:taggings) }
end
