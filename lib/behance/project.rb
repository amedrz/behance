# Projects Endpoints.
module Behance
  class Client
    module Project
      # Public: Search for projects.
      #
      # options - The Hash with options that the API would expect:
      #           :q           - Free text query string.
      #           :sort        - The order the results are returned in.
      #                          Possible values: featured_date (default),
      #                          appreciations, views, comments, published_date.
      #           :time        - Limits the search by time.
      #                          Possible values: all (default), today, week,
      #                          month.
      #           :field       - Limits the search by creative field.
      #                          Accepts a URL-encoded field name from the list
      #                          of defined creative fields.
      #           :country     - Limits the search by a 2-letter FIPS country
      #                          code.
      #           :state       - Limits the search by state or province name.
      #           :city        - Limits the search by city name.
      #           :page        - The page number of the results, always starting
      #                          with 1.
      #           :tags        - Limits the search by tags. Accepts one tag name
      #                          or a pipe-separated list of tag names.
      #           :color_hex   - Limit results to an RGB hex value (without #)
      #           :color_range - How closely to match the requested color_hex,
      #                          in color shades (default: 20) [0-255]
      #           :license     - Filter by creative license.
      #                          Acronyms found here:
      #                          http://creativecommons.org/licenses/
      #
      # Examples
      #
      #   @client.projects
      #   @client.projects(q: "Freelance", state: "CA", field: "Branding")
      #
      # Returns an array of projects in JSON format.
      def projects(options={})
        request("projects", options)["projects"]
      end

      # Public: Get the information and content of a project.
      #
      # project_id - the ID (Integer) of the project.
      #
      # Examples
      #
      #   @client.project(1123)
      #
      # Returns a single project in JSON format.
      def project(project_id)
        request("projects/#{project_id}")["project"]
      end

      # Public: Get the comments for a project
      #
      # project_id - The ID (Integer) of the project.
      # options    - The Hash with options that the API would expect:
      #              :page - The page number of the results, always starting
      #                      with 1.
      #
      # Examples
      #
      #   @client.project_comments(1)
      #   @client.project_comments(1, page: 1)
      #
      # Returns an array of project comments in JSON format.
      def project_comments(project_id, options={})
        request("projects/#{project_id}/comments", options)["comments"]
      end
    end
  end
end
