# Fields Endpoints.
module Behance
  class Client
    module Fields
      # Public: Retrieve all Creative Fields (in 'fields').
      #
      # Examples
      #
      #   @client.fields
      #
      # Returns an array of creative fields in JSON format.
      def fields
        request("fields")["fields"]
      end

      # Public: Retrieve all Creative Fields (in 'popular').
      #
      # Examples
      #
      #   @client.popular
      #
      # Returns an array of popular creative fields in JSON format.
      def popular
        request("fields")["popular"]
      end
    end
  end
end
