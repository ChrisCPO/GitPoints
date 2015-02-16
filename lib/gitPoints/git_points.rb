require "gitPoints/version"
require "json"
require "net/http"
require "vcr"
require "git_points"
require "webmock"
require_relative "config_vcr"
require_relative "data_retriever"
require_relative "profile_calculator"
require_relative "repo_calculator"
require_relative "time_calculator"
require_relative "user"

module Comparer
end
