# Projects Endpoints.
module Behance
  class Client
    module Project
      # Public: Search for projects.
      # 
      # q       - Free text query string.
      # sort    - The order the results are returned in. 
      #           Possible values: featured_date (default), appreciations, views, comments, 
      #           published_date.
      # time    - Limits the search by time. 
      #           Possible values: all (default), today, week, month.
      # field   - Limits the search by creative field. 
      #           Accepts a URL-encoded field name from the list of defined creative fields.
      # country - Limits the search by a 2-letter FIPS country code.
      # state   - Limits the search by state or province name.
      # city    - Limits the search by city name.
      # page    - The page number of the results, always starting with 1.
      # tags    - Limits the search by tags. 
      #           Accepts one tag name or a pipe-separated list of tag names.
      #
      # Examples
      # 
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
        request("project/#{project_id}")["project"]
      end

      # Public: Get the comments for a project
      # 
      # project_id - The ID (Integer) of the project. 
      # page       - The page number of the results, always starting with 1.
      # 
      # Examples
      # 
      #   @client.project_comments(1, page: 1)
      # 
      # Returns an array of project comments in JSON format.
      def project_comments(project_id)
        request("project_comments/#{project_id}")["comments"] 
      end
    end
  end
end
