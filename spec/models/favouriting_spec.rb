require 'rails_helper'

RSpec.describe Favouriting, type: :model do
  it { is_expected.to belong_to :article }
  it { is_expected.to belong_to :user }
end
