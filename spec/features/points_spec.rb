require "spec_helper"

describe GitPoints::UserPoints do
  describe "GitPoints.test_scope" do
    it "Can see the module" do
      modules_methods = GitPoints.instance_methods(false)

      expect(modules_methods.include?(:test_scope)).to eq true
    end
  end

  describe "UserPoints.git_points" do
    it "Can see the Class GitPoints" do
      # classes_methods = GitPoints::UserPoints.instance_methods(false)
      #
      # expect(classes_methods.include?(:git_points)).to eq true
    end

    it "returns users git hub points" do
      point_gitr = GitPoints::UserPoints

      expect(point_gitr.git_points("ChrisCPO")).to eq 31
    end
  end
end
