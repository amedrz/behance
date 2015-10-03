require File.expand_path('../project', __FILE__)
require File.expand_path('../user', __FILE__)
require File.expand_path('../wips', __FILE__)
require File.expand_path('../collections', __FILE__)
require File.expand_path('../fields', __FILE__)
require File.expand_path('../creatives_to_follow', __FILE__)
require 'faraday'
require 'faraday_middleware'

# Public: Methods handled by the Client connection.
module Behance

  class Client

    API_URL = "http://www.behance.net/v2/"

    include Behance::Client::Project
    include Behance::Client::User
    include Behance::Client::Wips
    include Behance::Client::Collections
    include Behance::Client::Fields
    include Behance::Client::CreativesToFollow

    attr_accessor :access_token, :connection

    # Public: Initialize a client for API requests.
    #
    # options - The Hash with options required by Behance:
    #           :access_token - Behance API token.
    #
    # Examples
    #
    #   @client = Behance::Client.new(access_token: "aKlie12MCJa5")
    #
    # Returns a Faraday instance object.
    def initialize(options={})
      @access_token = options[:access_token]
      @connection = Faraday.new(url: Behance::Client::API_URL) do |b|
        b.adapter Faraday.default_adapter
        b.use     FaradayMiddleware::ParseJson
      end
    end

    # Public: Makes a http request to the API.
    #
    # path     - A String that represents the endpoint path.
    # options  - Hash of parameters to pass along.
    #
    # Examples
    #
    #   request("users/1")
    #   request("projects", page: 2)
    #
    # Returns a response body from the API.
    def request(path, options={})
      response = @connection.get do |req|
        req.url path
        req.params[:api_key] = @access_token
        options.each do |key, val|
          req.params[key] = val
        end
      end
      response.body
    end
  end
end
