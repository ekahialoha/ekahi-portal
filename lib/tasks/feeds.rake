require 'digest/sha1'
namespace :feeds do
  desc "Fetches all RSS feeds and parses for new content to cache to DB"
  task fetch: :environment do
    articles = {}
    Feed.order(:id).all.each do |feed|
      open(feed.url) do |f|
        items = ActionPack::XmlParser.call(f)
        items['rss']['channel']['item'].each do |item|
          hash = Digest::SHA1.hexdigest(item['link'])
          articles[hash] = {
            title: item['title'],
            description: item['description'],
            pub_date: item['pubDate'],
            feed_id: feed.id,
            link: item['link'],
            image: item.include?('image') ? item['image'] : item['group']['content'].first()['url'],
            url_hash: hash
          }
        end
      end
    end

    already_stored = []
    duplicate_artiles = Article.where(url_hash: articles.keys)
    duplicate_artiles.each { |dupe| already_stored << dupe[:url_hash] }

    articles.each do |key, article|
      Article.create(article) unless already_stored.include?(article[:url_hash])
    end
  end

  desc "Cleans up cached RSS stores, will remove anything over 90 days"
  task 'clean:up': :environment do
  end

  desc "Truncates all current cached RSS stories"
  task clear: :environment do
  end

end
