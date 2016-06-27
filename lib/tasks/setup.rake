desc "Sets up all of the things for the API!"
task :setup do
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
