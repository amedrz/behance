# Collections Endpoints.
module Behance
  class Client
    module Collections
      # Public: Search for collections.
      #
      # options - The Hash with options that the API would expect:
      #           :q    - Free text query string.
      #           :time - Limits the search by time.
      #                   Possible values: all (default), today, week, month.
      #           :page - The page number of the results, always starting
      #                   with 1.
      #           :sort - The order the results are returned in.
      #                   Possible values: comments (default), views,
      #                   last_item_added_date.
      #
      # Examples
      #
      #   @client.collections
      #   @client.collections(q: "candy", time: "month")
      #
      # Returns an array of colelctions in JSON format.
      def collections(options={})
        request("collections", options)["collections"]
      end

      # Public: Get basic information about a collection.
      #
      # collection - it has to be an ID (Integer).
      #
      # Examples
      #
      #   @client.collection(1)
      #
      # Returns a single collection object.
      def collection(collection)
        request("collections/#{collection}")["collection"]
      end

      # Public: Get projects from a collection.
      #
      # collection - it has to be an ID (Integer).
      # options    - The Hash with options that the API would expect:
      #              :time     - Limits the search by time.
      #                          Possible values: all (default), today, week,
      #                          month.
      #              :page     - The page number of the results, always starting
      #                          with 1.
      #              :sort     - The order the results are returned in.
      #                          Possible values: featured_date (default),
      #                          appreciations, views, comments, published_date,
      #                          followed.
      #              :per_page - The number of results per page. (Max: 20)
      #
      # Examples
      #
      #   @client.collections_projects(1)
      #   @client.collections_projects(1, page: 2)
      #
      # Returns an array of projects from a collection in JSON format.
      def collection_projects(collection, options={})
        request("collections/#{collection}/projects", options)["projects"]
      end
    end
  end
end
