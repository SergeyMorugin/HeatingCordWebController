namespace :mqtt do
  task :subscribe => :environment do
    # Read BME280
    HomeAssistant.new.subscribe
  end
end
