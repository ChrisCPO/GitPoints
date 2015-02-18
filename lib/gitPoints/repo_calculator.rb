require "git_points"

class RepoCalculator
  attr_accessor :points
  attr_reader :hash

  def initialize(name)
    @points = 0
    @hash = DataRetriever.new(name, "/repos").get_data
  end

  def calculate
    add_points
    self.points
  end

  private

  def add_points
    hash.each do |repo|
      self.points += repo["stargazers_count"]
      self.points += repo["watchers_count"]
      self.points += repo["forks_count"]
    end
  end
end
