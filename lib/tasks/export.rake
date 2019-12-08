namespace :export do
  desc "Prints all current Feeds in friendly Model create compliant format for recreation"
  task "seed:feed": :environment do
    Feed.order(:id).all.each do |feed|
      puts "Feed.create(#{feed.serializable_hash(except: [ :id, :created_at, :updated_at ]).to_s})"
    end
  end
end
