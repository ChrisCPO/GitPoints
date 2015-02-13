require "spec_helper"

describe GitPoints::UserPoints do
  describe ".git_points" do
    context "returns the points of the user" do
      it { expect(UserPoints.git_points("test_user")).to eq 50 }
    end
  end
end
