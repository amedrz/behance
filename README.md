# The Behance Ruby Gem

A Ruby wrapper for the Behance API.

More information about the API capabilities can be found [here][api].

[api]: http://www.behance.net/devi

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

    $ client.project(1)

[Get the comments for a project][project_comments]

[project_comments]: http://www.behance.net/dev/api/endpoints/1#projects-get-5

    $ client.project_comments(1)

### Users

Pending

### Works in Progress

Pending

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2012-2013 Tractical.
See [LICENSE][] for details.

[license]: https://github.com/tractical/behance/blob/master/LICENSE.txt
