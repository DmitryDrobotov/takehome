require 'sinatra'
require 'pry'

require_relative 'takehome_client'

RESOURCES = %w(twitter facebook instagram)

get '/' do
  resource_collection = {}

  threads = RESOURCES.map do |resource|
    Thread.new { resource_collection[resource] = TakehomeClient.new.request(resource) }
  end

  threads.each(&:join)

  resource_collection.to_json
end
