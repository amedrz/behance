# Users Endpoints.
module Behance
  class Client
    module User
      # Public: Search for users.
      #
      # options - The Hash with options that the API would expect:
      #           :q       - Free text query string.
      #           :field   - Limits the search by creative field.
      #                      Accepts a URL-encoded field name from the list of
      #                      defined creative fields.
      #           :country - Limits the search by a 2-letter FIPS country code.
      #           :state   - Limits the search by state or province name.
      #           :city    - Limits the search by city name.
      #           :page    - The page number of the results, always starting
      #                      with 1.
      #           :sort    - The order the results are returned in.
      #                      Possible values: featured_date (default),
      #                      appreciations, views, comments, published_date,
      #                      followed.
      #           :tags    - Limits the search by tags.
      #                      Accepts one tag name or a pipe-separated list of
      #                      tag names.
      #
      # Examples
      #
      #   @client.users
      #   @client.users(q: "Juan", state: "California", tags: "freelance")
      #
      # Returns an array of users in JSON format.
      def users(options={})
        request("users", options)["users"]
      end

      # Public: Get basic information about a user.
      #
      # user - can be an ID (Integer) or username (String).
      #
      # Examples
      #
      #   @client.user(1)
      #   @client.user("foo")
      #
      # Returns a single user object.
      def user(user)
        request("users/#{user}")["user"]
      end

      # Public: Get the projects published by a user.
      #
      # user    - Can be an ID (Integer) or username (String)
      # options - The Hash with options that the API would expect:
      #           :sort - The order the results are returned in.
      #                   Possible values: featured_date (default),
      #                   appreciations, views, comments, published_date.
      #           :time - Limits the search by time.
      #                   Possible values: all (default), today, week, month.
      #           :page - The page number of the results, always starting
      #                   with 1.
      #
      # Examples
      #
      #   @client.user_projects(1)
      #   @client.user_projects("foo")
      #   @client.user_projects("foo", page: 2, sort: "views")
      #
      # Returns an array of projects in JSON format.
      def user_projects(user, options={})
        request("users/#{user}/projects", options)["projects"]
      end

      # Public: Get the works-in-progress published by a user.
      #
      # user    - can be an ID (Integer) or username (String).
      # options - The Hash with options that the API would expect:
      #           :sort - The order the results are returned in.
      #                   Possible values: featured_date (default),
      #                   appreciations, views, comments, published_date.
      #           :time - Limits the search by time.
      #                   Possible values: all (default), today, week, month.
      #           :page - The page number of the results, always starting
      #                   with 1.
      #
      # Examples
      #
      #   @client.user_wips(1)
      #   @client.user_wips(1, page: 2)
      #   @client.user_wips("foo", sort: "comments", page: 3)
      #
      # Returns an array of work-in-progress in JSON format.
      def user_wips(user, options={})
        request("users/#{user}/wips", options)["wips"]
      end

      # Public: Get a list of user's recently appreciated projects.
      #
      # user    - can be an ID (Integer) or username (String).
      # options - The Hash with options that the API would expect:
      #           :page - The page number of the results, always starting
      #                   with 1.
      #
      # Examples
      #
      #   @client.user_appreciations(1)
      #   @client.user_appreciations("foo", page: 2)
      #
      # Returns an array of user's recently appreciated projects in JSON
      # format.
      def user_appreciations(user, options={})
        request("users/#{user}/appreciations", options)["appreciations"]
      end

      # Public: Get a list of a user's collections.
      #
      # user    - can be an ID (Integer) or username (String).
      # options - The Hash with options that the API would expect:
      #           :time - Limits the search by time.
      #                   Possible values: all (default), today, week, month.
      #           :page - The page number of the results, always starting
      #                   with 1.
      #
      # Examples
      #
      #   @client.user_collections(1)
      #   @client.user_collections("foo")
      #
      # Returns an array of user's public collections in JSON
      # format.
      def user_collections(user, options={})
        request("users/#{user}/collections", options)["collections"]
      end

      # Public: Get user's statistics (all-time and today).
      #
      # user - can be an ID (Integer) or username (String).
      #
      # Examples
      #
      #   @client.user_stats(1)
      #   @client.user_stats("foo")
      #
      # Returns "today" and "all_time" stats objects.
      def user_stats(user)
        request("users/#{user}/stats")["stats"]
      end

      # Public: Get a list of creatives who follow the user.
      #
      # user    - can be an ID (Integer) or username (String).
      # options - The Hash with options that the API would expect:
      #           :page       - The page number of the results, always starting
      #                         with 1.
      #           :sort       - The order the results are returned in.
      #                         Possible values: created_date (default),
      #                         appreciations, views, comments, followed, alpha.
      #           :sort_order - The direction in which the results are returned.
      #                         Possible values: asc, desc.
      #           :per_page   - The number of results per page. (Max: 20)
      #
      # Examples
      #
      #   @client.user_followers(1)
      #   @client.user_followers(1, page: 2)
      #   @client.user_followers("foo", sort: "alpha", page: 3)
      #
      # Returns an array of creatives who follow the user in JSON format.
      def user_followers(user, options={})
        request("users/#{user}/followers", options)["followers"]
      end

      # Public: Get a list of creatives followed by the user.
      #
      # user    - can be an ID (Integer) or username (String).
      # options - The Hash with options that the API would expect:
      #           :page       - The page number of the results, always starting
      #                         with 1.
      #           :sort       - The order the results are returned in.
      #                         Possible values: created_date (default),
      #                         appreciations, views, comments, followed, alpha.
      #           :sort_order - The direction in which the results are returned.
      #                         Possible values: asc, desc.
      #           :per_page   - The number of results per page. (Max: 20)
      #
      # Examples
      #
      #   @client.user_following(1)
      #   @client.user_following(1, page: 2)
      #   @client.user_following("foo", sort: "alpha", page: 3)
      #
      # Returns an array of creatives followed by the user in JSON format.
      def user_following(user, options={})
        request("users/#{user}/following", options)["following"]
      end

      # Public: A list of the user's professional experience
      #
      # user - can be an ID (Integer) or username (String).
      #
      # Examples
      #
      #   @client.user_work_experience(1)
      #   @client.user_work_experience("foo")
      #
      # Returns an array od user's professions experience.
      def user_work_experience(user)
        request("users/#{user}/work_experience")["work_experience"]
      end
    end
  end
end
