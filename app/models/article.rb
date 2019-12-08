class Article < ApplicationRecord
  validates :title, length: { minimum: 3 }
  validates :link, presence: true, length: { minimum: 10 }

  belongs_to :feed
end
