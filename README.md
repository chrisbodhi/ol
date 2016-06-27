
##Setup
- Clone this repo.
- Run `bundle install`.
- Run `rake setup`, which will
  - Use `curl` to download the source data file, in gzip format...
  - Extract the source data file to a file named `data.csv`...
  - Set up and run migrations for the development, test, and production environments...
  - Seed the data from the CSV file into the development and production environments...
  - and lastly, run the tests using rspec!

##Usage
- Each page of results will return 50 JSON objects
- Visit, say, http://localhost:3000/api/businesses?page=5, to see ID #200 to ID #249
- Visitng a specific ID will return the entry from the db at the corresponding id

####Print a Formatted JSON Object
Just add the query param `pretty` to your request, along with a truthy value. For example:

```
http://localhost:3000/api/businesses/42?pretty=plz
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

`{"id":42,"uuid":"7ed636aa-7b5c-428b-957c-844cbbd45e2e","name":"Lesch, Rath and Larson","address":"21217 Tori Valleys","address2":"Apt. 400","city":"Pfannerstillmouth","state":"IN","zip":"08574","country":"US","phone":"5991751665","website":"http://connelly-renner.com/","created_at":"2012-05-28T08:05:13.000Z","updated_at":"2016-06-23T18:17:14.818Z"}`
