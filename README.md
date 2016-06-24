
##Setup
- Download the source data from [this S3 link](https://s3.amazonaws.com/ownlocal-engineering/engineering_project_businesses.csv.gz), unarchive it, and rename it to `data.csv`. Place this file in the project root.
- Run `rake db:migrate` to prep the database
- Run `rake db:seed` to add the data from `data.csv` into the database
