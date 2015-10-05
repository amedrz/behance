# The Behance Ruby Gem

A Ruby wrapper for the Behance API.

More information about the API capabilities can be found [here][api].

[api]: https://www.behance.net/dev

## Installation

```
$ gem install behance
```

## API Usage Examples

First of all, you will need to get an access token [here][register].

[register]: https://www.behance.net/dev/register

Once you get it, you'll be able to start playing

```ruby
# initializing the client
client = Behance::Client.new(access_token: "access-token")
```

### Projects

[Search for projects][projects]

[projects]: https://www.behance.net/dev/api/endpoints/1#projects-get-10

```ruby
client.projects
client.projects(city: "San Francisco", state: "California", field: "branding")
```

[Get the information and content of a project][project]

[project]: https://www.behance.net/dev/api/endpoints/1#projects-get-4

```ruby
client.project(5133725)
```

[Get the comments for a project][project_comments]

[project_comments]: https://www.behance.net/dev/api/endpoints/1#projects-get-5

```ruby
client.project_comments(5133725)
```

### Users

[Search for users][users]

[users]: https://www.behance.net/dev/api/endpoints/2#users-get-9

```ruby
client.users
client.users(state: "California", city: "San Francisco")
```

[Get basic information about a user][user]

[user]: https://www.behance.net/dev/api/endpoints/2#users-get-1

```ruby
client.user(920309)
client.user("jonkap1")
```

[Get the projects published by a user][user_projects]

[user_projects]: https://www.behance.net/dev/api/endpoints/2#users-get-2

```ruby
client.user_projects(920309)
client.user_projects("jonkap1")
client.user_projects("jonkap1", page: 2, sort: "views")
```

[Get the works-in-progress published by a user][user_wips]

[user_wips]: https://www.behance.net/dev/api/endpoints/2#users-get-3

```ruby
client.user_wips(920309)
client.user_wips(920309, page: 2)
client.user_wips("jonkap1", sort: "comments", page: 3)
```

[Get a list of user's recently appreciated projects][user_appreciations]

[user_appreciations]: https://www.behance.net/dev/api/endpoints/2#users-get-13

```ruby
client.user_appreciations(920309)
client.user_appreciations("jonkap1", page: 2)
```

[Get a list of a user's collections][user_collections]

[user_collections]: https://www.behance.net/dev/api/endpoints/2#users-get-21

```ruby
client.user_collections(42)
client.user_collections(42, page: 2)
client.user_collections("rur", page: 2)
```

[Get user's statistics (all-time and today)][user_stats]

[user_stats]: https://www.behance.net/dev/api/endpoints/2#users-get-55

```ruby
client.user_stats(42)
client.user_stats("jonkap1")
```

[Get a list of creatives who follow the user][user_followers]

[user_followers]: https://www.behance.net/dev/api/endpoints/2#users-get-57

```ruby
client.user_followers(1)
client.user_followers("foo", sort: "alpha", page: 2)
```

[Get a list of creatives followed by the user][user_following]

[user_following]: https://www.behance.net/dev/api/endpoints/2#users-get-59

```ruby
client.user_following(1)
client.user_following("foo", sort: "alpha", page: 2)
```

[A list of the user's professional experience][user_work_experience]

[user_work_experience]: https://www.behance.net/dev/api/endpoints/2#users-get-71

```ruby
client.user_work_experience(42)
client.user_work_experience("jonkap1")
```

### Works in Progress

[Search for works-in-progress][wips]

[wips]: https://www.behance.net/dev/api/endpoints/3#work-in-progress-get-11

```ruby
client.wips
client.wips(time: "today", page: 2)
```

[Get information about a work in progress][wip]

[wip]: https://www.behance.net/dev/api/endpoints/3#work-in-progress-get-6

```ruby
client.wip(69)
```

[Get information and contents of a revision of a work in progress][wip_revision]

[wip_revision]: https://www.behance.net/dev/api/endpoints/3#work-in-progress-get-7

```ruby
client.wip_revision(69, 133)
```

[Get comments on a revision of a work in progress][wip_revision_comments]

[wip_revision_comments]: https://www.behance.net/dev/api/endpoints/3#work-in-progress-get-8

```ruby
client.wip_revision_comments(69, 133)
client.wip_revision_comments(69, 133, page: 2)
```

### Collections

[Search for collections][collections]

[collections]: https://www.behance.net/dev/api/endpoints/5#collections-get-15

```ruby
client.collections
client.collections(time: "today", page: 2)
```

[Get basic information about a collection][collection]

[collection]: https://www.behance.net/dev/api/endpoints/5#collections-get-17

```ruby
client.collection(5074147)
```

[Get projects from a collection][collection_projects]

[collection_projects]: https://www.behance.net/dev/api/endpoints/5#collections-get-19

```ruby
client.collection_projects(5074147)
client.collection_projects(5074147, page: 2)
```

### Creative Fields

[Retrieves all Creative Fields][fields]

[fields]: https://www.behance.net/dev/api/endpoints/11#creative-fields-get-75

```ruby
client.fields
```

[Retrieves popular Creative Fields][popular]

[popular]: https://www.behance.net/dev/api/endpoints/11#creative-fields-get-75

```ruby
client.popular
```

### Creatives To Follow

[Provides a list of creatives you might be interested in following][creatives_to_follow]

[creatives_to_follow]: https://www.behance.net/dev/api/endpoints/9#creatives-to-follow-get-69

```ruby
client.creatives_to_follow
client.creatives_to_follow(page: 2)
```

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
