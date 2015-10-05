# Creatives To Follow Endpoints.
module Behance
  class Client
    module CreativesToFollow
      # Public: Provides a list of creatives you might be interested
      #         in following
      #
      # options - The Hash with options that the API would expect:
      #           :page - The page number of the results, always
      #                   starting with 1.
      #
      # Examples
      #
      #   @client.creatives_to_follow
      #   @client.creatives_to_follow(page: 2)
      #
      # Returns an array of creatives in JSON format.
      def creatives_to_follow(options={})
        request("creativestofollow", options)["creatives_to_follow"]
      end
    end
  end
end
