require 'rails_helper'

RSpec.describe ArticlesHelper, type: :helper do
  describe "md_to_html" do
    it "converts the passed text to markdown" do
      expect(helper.md_to_html("*Bold*")).to eq("<p><em>Bold</em></p>\n")
    end
  end
end
