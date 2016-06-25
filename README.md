
##Setup
- Download the source data from [this S3 link](https://s3.amazonaws.com/ownlocal-engineering/engineering_project_businesses.csv.gz), unarchive it, and rename it to `data.csv`. Place this file in the project root.
- `bundle install`
- Run `rake db:migrate` to prep the databases
- Run `rake db:seed` to add the data from `data.csv` into the database
- `bin/rspec` to run all of the tests

##Usage
- Each page of results will return 50 JSON objects
- Visit, say, http://localhost:3000/api/businesses?page=5, to see ID #200 to ID #249
