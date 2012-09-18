# Users Endpoints.
module Behance
	class Client
		module User
			# Public: Search for users.
			#
			# q       - Free text query string.
			# field   - Limits the search by creative field. 
			#           Accepts a URL-encoded field name from the list of defined creative fields.
			# country - Limits the search by a 2-letter FIPS country code.
			# state   - Limits the search by state or province name.
			# city    - Limits the search by city name.
			# page    - The page number of the results, always starting with 1.
			# sort    - The order the results are returned in. 
			#           Possible values: featured_date (default), appreciations, views, comments, 
			#           published_date, followed.
			# tags    - Limits the search by tags. 
			#           Accepts one tag name or a pipe-separated list of tag names.
			#
			# Examples
			#
			#   @client.users(q: "Juan", state: "California", :tags "freelance,web")
			#
			# Returns an array of users in JSON format.
			def users(options)
				true
			end

			# Public: Get basic information about a user.
			#
			# user - can be an ID (Integer) or username (String).
			#
			# Returns a single user object.
			def user(user)
				true
			end

			# Public: Get the projects published by an user. 
			#
			# user - Can be an ID (Integer) or username (String)
			# sort - The order the results are returned in. 
			#        Possible values: featured_date (default), appreciations, views, 
			#        comments, published_date.
			# time - Limits the search by time. 
			#        Possible values: all (default), today, week, month.
			# page - The page number of the results, always starting with 1.
			#
			# Returns an array of projects published an user in JSON format.
			def user_projects(user)
				true
			end

			# Public: Get the works-in-progress published by a user.
			#
			# user - can be an ID (Integer) or username (String).
			# sort - The order the results are returned in. 
			#        Possible values: featured_date (default), appreciations, views, 
			#        comments, published_date.
			# time - Limits the search by time. Possible values: all (default), 
			#        today, week, month.
			# page - The page number of the results, always starting with 1.
			#
			# Returns an array of work-in-progress of an user in JSON format.
			def user_wips(user)
				true
			end

			# Public: Get a list of user's recently appreciated projects.
			#
			# user - can be an ID (Integer) or username (String).
			#
			# Returns an array of user's recently appreciated projects in JSON
			# format.
			def user_appreciated_projects(user)
				true
			end
		end
	end
end
