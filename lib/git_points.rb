require "json"
require "net/http"
require "vcr"
require_relative "gitPoints/data_retriever"
require_relative "gitPoints/profile_calculator"
require_relative "gitPoints/repo_calculator"
require_relative "gitPoints/time_calculator"
require_relative "gitPoints/user"

module GitPoints
  def test_scope
  end

  class UserPoints
    def self.git_points(name)
      User.new(name).assign_points
    end
  end
end
