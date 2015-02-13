require "gitPoints/version"

module GitPoints
  class UserPoints
    def self.git_points(name)
      user = User.new(name)
      user.points
    end
  end
end
