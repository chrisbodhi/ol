
##Setup
- Download the source data from [this S3 link](https://s3.amazonaws.com/ownlocal-engineering/engineering_project_businesses.csv.gz), unarchive it, and rename it to `data.csv`. Place this file in the project root.
- Run `bundle install`.
- Run `rake db:migrate:all` to prep the databases
- Run `rake db:seed:all` to add the data from `data.csv` into the databases
- `bin/rspec` to run all of the tests

##Usage
- Each page of results will return 50 JSON objects
- Visit, say, http://localhost:3000/api/businesses?page=5, to see ID #200 to ID #249

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
