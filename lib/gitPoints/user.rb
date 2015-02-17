require "git_points"

class User
  attr_reader :name, :points, :repo_score, :profile_score

  def initialize(name)
    @name = name
  end

  def assign_points
    @points = repo_points + profile_points
  end

  private

  def repo_points
    @repo_score = RepoCalculator.new(name).calculate
  end

  def profile_points
    @profile_score = ProfileCalculator.new(name).calculate
  end
end
