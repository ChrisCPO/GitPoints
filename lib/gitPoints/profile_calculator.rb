require "git_points"

class ProfileCalculator
  attr_accessor :points
  attr_reader :hash , :profile_info

  ONE_COUNT = 1
  ZERO_COUNT = 0

  def initialize(name)
    @points = 0
    @hash = DataRetriever.new(name).get_data
    @profile_info = [{title: "bio", points: 100},
                     {title: "blog", points: 3},
                     {title: "location", points: 1},
                     {title: "email", points: 2},
                     {title: "name", points: 1}
                    ]
  end

  def calculate
    base_points
    check_items
    points
  end

  private

  def check_items
    count = 0
    profile_info.each do |item|
      count += profile_item_is_complete?(item)
    end
    profile_is_complete?(count)
  end

  def base_points
    self.points += hash["public_repos"]
    self.points += hash["followers"]
    self.points += hash["public_gists"]
    self.points += TimeCalculator.new(hash).calculate
    self.points - hash["id"].to_s.length
  end

  def profile_is_complete?(count)
    if count == profile_info.length
      self.points += 2
    end
  end

  def profile_item_is_complete?(search)
    if hash[search[:title]] == nil || hash[search[:title]].to_s.length == 0
      ZERO_COUNT
    else
      self.points += search[:points]
      ONE_COUNT
    end
  end
end
