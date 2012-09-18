require File.expand_path('../project', __FILE__)
require File.expand_path('../user', __FILE__)
require 'faraday'
# Public: Methods handled by the Client connection.
module Behance
  class Client

    include Behance::Client::Project
    include Behance::Client::User

    attr_accessor :access_token

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
      @connection ||= Faraday.new(:url => api_url) do |builder|
        builder.adapter Faraday.default_adapter
      end
    end

    private

    # Internal: Makes a request to the API.
    #
    # path - A String that represents the endpoint path.
    #
    # Examples
    #
    #   @client.request("/users/1")
    #
    # Returns a response body from the API.
    def request(path)
      @connection.get do |req|
        req.url path, :api_key => @access_token
      end
    end

    # Internal: Base URL for API requests.
    #
    # Returns an URL String.
    def api_url
      ("http://www.behance.net/v2/").freeze
    end
  end
end
