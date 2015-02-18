require "spec_helper"

describe RepoCalculator do
  describe ".calculate" do
    it "returns info for users repos" do
      VCR.use_cassette("ChrisCPO_test_repos") do
        url = URI("https://api.github.com/users/ChrisCPO/repos")
        response = Net::HTTP.get(url)
        repo_calculator = RepoCalculator.new("ChrisCPO")

        allow_any_instance_of(DataRetriever).to receive(:call_data) { response }

        expect(repo_calculator.calculate).to eq 7
      end
    end
  end
end
