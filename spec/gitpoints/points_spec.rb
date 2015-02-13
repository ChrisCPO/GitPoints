require "spec_helper"

describe GitPoints::UserPoints do
  describe ".git_points" do
    it "returns the points of the user" do
      expect(GitPoints::UserPoints.new(git_points("test_user"))).to eq 50
    end
  end
end
