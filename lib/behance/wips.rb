# Work-in-progress endpoints
module Behance
  class Client
    module Wips
      # Public: Search for works-in-progress.
      #
      # options - The Hash with options that the API would expect:
      #           :time - Limits the search by time. 
      #                   Possible values: all (default), today, 
      #                   week, month.
      #           :page - The page number of the results, always 
      #                   starting with 1.
      #           :sort - The order the results are returned in. 
      #                   Possible values: comments (default), 
      #                   views, last_item_added_date.
      #           :tags - Limits the search by tags. Accepts one 
      #                   tag name or a pipe-separated list of tag 
      #                   names.
      #
      # Examples
      #
      #   @client.wips
      #   @client.wips(time: "today", page: 2)
      #
      # Returns a Hash of wips in JSON format.
      def wips(options={})
        request("wips", options)["wips"]
      end

      # Public: Get information about a work in progress.
      #
      # wip_id - The ID (Integer) of a wip.
      #
      # Examples
      # 
      #   @client.wip(69)
      #
      # Returns a wip in JSON format.
      def wip(wip_id)
        request("wips/#{wip_id}")["wip"]
      end

      # Public: Get information and contents of a revision of a 
      # work in progress.
      #
      # wip_id      - The ID (Integer) from the work in progress
      #               to look for.
      # revision_id - The ID (Integer) from the revision to look 
      #               for.
      #
      # Examples
      #
      #   @client.wip_revision(69, 133)
      #
      # Returns a work-in-progress revision in JSON format.
      def wip_revision(wip_id, revision_id)
        request("wips/#{wip_id}/#{revision_id}")["revision"]
      end

      # Public: Get comments on a revision of a work in progress.
      #
      # wip_id      - The ID (Integer) from the work in progress
      #               to look for.
      # revision_id - The ID (Integer) from the revision to look 
      #               for.
      #
      # Examples
      #
      #   @client.wip_revision_comments(69, 133)
      #
      # Returns a work-in-progress revision comments in JSON
      # format.
      def wip_revision_comments(wip_id, revision_id)
        request("wips/#{wip_id}/#{revision_id}/comments")["comments"]
      end
    end
  end
end
