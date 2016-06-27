desc "Sets up all of the things for the API: get data, prep & seed db's, delete files, and runs rspec once."
task :setup do
  unless File.exist? 'data.csv'
    system("curl https://s3.amazonaws.com/ownlocal-engineering/engineering_project_businesses.csv.gz --output data.csv.gz")

    Zlib::GzipReader.open('data.csv.gz') do | input_stream |
      File.open('data.csv', 'w') do |output_stream|
        IO.copy_stream(input_stream, output_stream)
      end
      puts "Decompressed the data! \xF0\x9F\x93\xA0"
    end
  end

  if File.size? 'data.csv' and File.exist? 'data.csv.gz'
    File.delete 'data.csv.gz'
    puts "Removed the compressed data file, data.csv.gz! \xe2\x99\xbb\xef\xb8\x8f"
  end

  ['development', 'test', 'production'].each { |env|
    system("rake db:create RAILS_ENV=#{env}")
    system("rake db:migrate RAILS_ENV=#{env}")
    unless env == 'test'
      system("rake db:seed RAILS_ENV=#{env}")
    end
  }
  
  system("rspec")
  puts "Setup complete! \xF0\x9F\x99\x8C"
end
