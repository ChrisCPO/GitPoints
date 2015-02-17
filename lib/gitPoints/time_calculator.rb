require "git_points"

class TimeCalculator
  attr_accessor :points
  attr_reader :hash, :points_per_year


  def initialize(hash)
    @points = 0
    @hash = hash
    @points_per_year = 5
  end

  def calculate
    created_year = Time.parse(hash["created_at"]).year
    current_year = Time.new.year
    self.points = (current_year - created_year) * points_per_year
  end
end
