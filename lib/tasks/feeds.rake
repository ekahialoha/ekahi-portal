namespace :feeds do
  desc "Fetches all RSS feeds and parses for new content to cache to DB"
  task fetch: :environment do
    Feed.order(:id).all.each do |feed|
      open(feed.url) do |f|
        items = ActionPack::XmlParser.call(f)
        puts items['rss']['channel']['item'].count()
        items['rss']['channel']['item'].each do |item|
          Article.first_or_create(
            title: item['title'],
            description: item['description'],
            pub_date: item['pubDate'],
            feed_id: feed.id,
            link: item['link'],
            image: item.include?('image') ? item['image'] : item['group']['content'].first()['url']
          )
        end
      end
    end
  end

  desc "Cleans up cached RSS stores, will remove anything over 90 days"
  task 'clean:up': :environment do
  end

  desc "Truncates all current cached RSS stories"
  task clear: :environment do
  end

end
