namespace :feeds do
  desc "Fetches all RSS feeds and parses for new content to cache to DB"
  task fetch: :environment do
  end

  desc "Cleans up cached RSS stores, will remove anything over 90 days"
  task 'clean:up': :environment do
  end

  desc "Truncates all current cached RSS stories"
  task clear: :environment do
  end

end
