#Businesses API
_offering endpoints to access both whole pages of business data and data on individual businesses :tada: **now with JSON!** :tada:_
![step 3: profit!](http://media3.giphy.com/media/3oEjHQmvkaHgKaXhWE/giphy.gif)

##Setup
###Prereqs :thought_balloon:
- Ruby &mdash; this was developed on v2.3.1
- Get the RubyGems package manager if you don't already have it &mdash; [options for getting it are here](https://rubygems.org/pages/download)
- Ensure you have `bundle` installed: `bundle -v` || `gem install bundler`
- This repo, cloned or forked onto your machine

###Action Items :bookmark_tabs:
- Run `bundle install`.
- Run `rake setup`, which will
  - Use `curl` to download the source data file, in gzip format...
  - Extract the source data file to a file named `data.csv`...
  - Set up and run migrations for the development, test, and production environments...
  - Seed the data from the CSV file into the development and production environments...
  - and lastly, run the tests using `rspec`!
- That's it!

##Usage :fax:
- Start the server on port 3000 by running `bin/rails server` in the project root.
  - Try out the production version by setting the environment variable with `RAILS_ENV=production`, like so: `RAILS_ENV=production bin/rails s`
- The server exposes endpoints for accessing pages of business data and data on an individual business.
  - Access the first 50 results by visiting [http://localhost:3000/api/businesses](http://localhost:3000/api/businesses).
  - Each page of results will, by default, return 50 JSON objects, in ascending order.
    - To change the number of results returned per page, set the query param `per_page` to any number from 1 to 100: [http://localhost:3000/api/businesses?per_page=7](http://localhost:3000/api/businesses?per_page=7) to return seven results for that page.
- The next endpoint is used to get data on an individual business, based on their ID in the database.
  - [http://localhost:3000/api/businesses/42](http://localhost:3000/api/businesses/42) will display information on Lesch, Rath and Larson.
- Sending a GET request to the root, um, route, [http://localhost:3000](http://localhost:3000), will return JSON with a brief overview of the API's endpoints. I like to think of it as the table of contents. Or, in this case, "content."

###Pretty Print a JSON Response :lipstick:
Just add the query param `pretty` to your request to the `/api/businesses` path, along with a truthy value. For example:

```
curl "http://localhost:3000/api/businesses/42?pretty=plz"
```

will return

```
{
  "id": 42,
  "uuid": "7ed636aa-7b5c-428b-957c-844cbbd45e2e",
  "name": "Lesch, Rath and Larson",
  "address": "21217 Tori Valleys",
  "address2": "Apt. 400",
  "city": "Pfannerstillmouth",
  "state": "IN",
  "zip": "08574",
  "country": "US",
  "phone": "5991751665",
  "website": "http://connelly-renner.com/",
  "created_at": "2012-05-28T08:05:13.000Z",
  "updated_at": "2016-06-23T18:17:14.818Z"
}
```

as opposed to

```
{"id":42,"uuid":"7ed636aa-7b5c-428b-957c-844cbbd45e2e","name":"Lesch, Rath and Larson","address":"21217 Tori Valleys","address2":"Apt. 400","city":"Pfannerstillmouth","state":"IN","zip":"08574","country":"US","phone":"5991751665","website":"http://connelly-renner.com/","created_at":"2012-05-28T08:05:13.000Z","updated_at":"2016-06-23T18:17:14.818Z"}
```

##Implementation Details :mag:
- The `will_paginate` gem is used to handle pagination of the results for requests to the main endpoint.
- Rather than placing the API version number in the slug for the URL, the router is set up to direct requests to the default version of the API, unless otherwise specified in the incoming request's `Accept` header: `Accept: "application/vnd.ol.vx"` where `x` is the version number.
- In the spirit of Ruby &mdash; offering devs more than one way to accomplish something &mdash; `Link` metadata is available both in the response header and the JSON response of requests for pages.
- The JSON response also contains some more metadata: `current_page`, `per_page`, and `total_entries` keys with their corresponding values as numbers
- Tests were written using Rspec, Factory Girl, and Faker. To run the tests, run `bin/rspec` from the project root after completing installation.

##Contributing :memo:
- First of all: Awesome! Thank you! Can't wait to add your handle to the List of Most-Hallowed Contributors. _todo: create a list of most-hallowed contributors_
- Next, if there's an existing [issue](https://github.com/chrisbodhi/ol/issues), assign it to yourself & get crackin'! If not, create an issue, self-assign it, & then get crackin'!
- Once your fix/feature is complete and all of the tests passed [because you wrote tests, right?], open a pull-request. If you want to squash your commits, that's cool; if not, also cool. [Reference your claimed issue](https://github.com/blog/1506-closing-issues-via-pull-requests) in the PR description.
- Time to bask in the glory of a job well done.

![Time to bask in the glory of a job well done.](https://i.imgur.com/8QDVjFo.gif)
