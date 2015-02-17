require "spec_helper"

describe ProfileCalculator do
  describe ".calculate" do
    it "returns info for users repos" do
      VCR.use_cassette("ChrisCPO_test_profile") do
        url = URI("https://api.github.com/users/ChrisCPO")
        @response = Net::HTTP.get(url)
        profile_calculator = ProfileCalculator.new("ChrisCPO")

        allow_any_instance_of(DataRetriever).to receive(:call_data) { @response }

        expect(profile_calculator.calculate).to eq 31
      end
    end
  end
end
