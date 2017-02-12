require 'rails_helper'

describe Comment do
  describe 'validations' do
    context "invalid attributes" do 
    it "is is invalid without a comment" do
      comment = Comment.new()
      expect(comment).to be_invalid
    end
  end
end

  context "valid attributes" do
    it "is valid with content" do
      comment = Comment.new(content: "Interview set up for tomorrow")
      expect(comment).to be_valid
    end
  end
end