# The Behance Ruby Gem

A Ruby wrapper for the Behance API.

More information about the API capabilities can be found [here][api].

[api]: http://www.behance.net/dev

## Installation

    $ gem install behance

## API Usage Examples

First of all, you will need to get an access token [here][register].

[register]: http://www.behance.net/dev/register

Once you get it, you'll be able to start playing

    # initializing the client
    $ client = Behance::Client.new(access_token: "access-token")

### Projects

[Search for projects][projects]

[projects]: http://www.behance.net/dev/api/endpoints/1#projects-get-10

    $ client.projects
    $ client.projects(city: "San Francisco", state: "California", field: "branding")

[Get the information and content of a project][project]

[project]: http://www.behance.net/dev/api/endpoints/1#projects-get-4

    $ client.project(5133725)

[Get the comments for a project][project_comments]

[project_comments]: http://www.behance.net/dev/api/endpoints/1#projects-get-5

    $ client.project_comments(5133725)

### Users

[Search for users][users] 

[users]: http://www.behance.net/dev/api/endpoints/2#users-get-9

    $ client.users
    $ client.users(state: "California", city: "San Francisco")

[Get basic information about an user][user]

[user]: http://www.behance.net/dev/api/endpoints/2#users-get-1

    $ client.user(920309)
    $ client.user("jonkap1")

[Get the projects published by an user][user_projects]

[user_projects]: http://www.behance.net/dev/api/endpoints/2#users-get-2

    $ client.user_projects(920309)
    $ client.user_projects("jonkap1")
    $ client.user_projects("jonkap1", page: 2, sort: "views")

[Get the works-in-progress published by an user][user_wips]

[user_wips]: http://www.behance.net/dev/api/endpoints/2#users-get-3

    $ client.user_wips(920309)
    $ client.user_wips(920309, page: 2)
    $ client.user_wips("jonkap1", sort: "comments", page: 3)

[Get a list of user's recently appreciated projects][user_appreciations]

[user_appreciations]: http://www.behance.net/dev/api/endpoints/2#users-get-13

    $ client.user_appreciations(920309)
    $ client.user_appreciations("jonkap1")

[Get a list of a user's collections. The user argument can be an ID or username.][user_collections]

[user_collections]: http://www.behance.net/dev/api/endpoints/2#users-get-21

    $ client.user_collections(42)
    $ client.user_collections(42, page: 2)
    $ client.user_collections("rur", page: 2)

[A list of the user's professional experience.][user_work_experience]

[user_work_experience]: https://www.behance.net/dev/api/endpoints/2#users-get-71

    $ client.user_work_experience(42)
    $ client.user_work_experience("jonkap1")

### Works in Progress

[Search for works-in-progress][wips]

[wips]: http://www.behance.net/dev/api/endpoints/3#work-in-progress-get-11

    $ client.wips
    $ client.wips(time: "today", page: 2)

[Get information about a work in progress][wip]

[wip]: http://www.behance.net/dev/api/endpoints/3#work-in-progress-get-6

    $ client.wip(69)

[Get information and contents of a revision of a work in progress][wip_revision]

[wip_revision]: http://www.behance.net/dev/api/endpoints/3#work-in-progress-get-7

    $ client.wip_revision(69, 133)

[Get comments on a revision of a work in progress][wip_revision_comments]

[wip_revision_comments]: http://www.behance.net/dev/api/endpoints/3#work-in-progress-get-8

    $ client.wip_revision_comments(69, 133)

### Collections

[Search for collections][collections]

[collections]: http://www.behance.net/dev/api/endpoints/5#collections-get-15

    $ client.collections
    $ client.collections(time: "today", page: 2)

[Get basic information about a collection][collection]

[collection]: http://www.behance.net/dev/api/endpoints/5#collections-get-17

    $ client.collection(5074147)

[Get projects from a collection][collection_projects]

[collection_projects]: http://www.behance.net/dev/api/endpoints/5#collections-get-19

    $ client.collection_projects(5074147)
    $ client.collection_projects(5074147, page: 2)

### Creative Fields

[Retrieve all Creative Fields][fields]

[fields]: https://www.behance.net/dev/api/endpoints/11#creative-fields-get-75

    $ client.fields

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2012-2013 Tractical.
See [LICENSE][license] for details.

[license]: https://github.com/tractical/behance/blob/master/LICENSE.txt
