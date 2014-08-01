# Fields Endpoints.
module Behance
  class Client
    module Fields
      # Public: Retrieve all Creative Fields.
      #
      # Examples
      #
      #   @client.fields
      #
      # Returns an array of creative fields in JSON format.
      def fields
        request("fields")["fields"]
      end
    end
  end
end
