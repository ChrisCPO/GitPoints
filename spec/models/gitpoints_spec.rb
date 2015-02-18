require "spec_helper"

describe GitPoints::UserPoints do
  describe "#git_points" do
    it "returns user's points" do
      point_getter = GitPoints::UserPoints

      allow_any_instance_of(DataRetriever).to receive(:call_data) { nil }
      allow_any_instance_of(DataRetriever).to receive(:get_data) { nil }
      allow_any_instance_of(RepoCalculator).to receive(:calculate) { 5 }
      allow_any_instance_of(ProfileCalculator).to receive(:calculate) { 5 }

      expect(point_getter.git_points("test")).to eq 10
    end
  end
end
