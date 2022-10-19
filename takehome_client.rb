require 'net/http'
require 'json'

require_relative 'retryable'

class TakehomeClient
  include Retryable

  def initialize
    @host = 'https://takehome.io/'
  end

  def request(resource)
    uri = URI(@host + resource)

    retryable(retry_on: [JSON::ParserError]) { JSON.parse(Net::HTTP.get(uri)) }
  rescue Retryable::TriesExceededError
    []
  end
end
