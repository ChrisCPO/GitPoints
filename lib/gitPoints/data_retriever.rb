require "git_points"

class DataRetriever
  attr_reader :name_url, :extension_url

  def initialize(name_url, extension_url = "")
    @extension_url = extension_url
    @name_url = name_url
  end

  def get_data
    JSON.parse(call_data)
  end

  private

  def url
    URI("https://api.github.com/users/" + name_url + extension_url)
  end

  def call_data
    Net::HTTP.get(url)
  end
end
