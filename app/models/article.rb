class Article < ApplicationRecord
  validates :title, length: { in: 3..55 }
  validates :link, presence: true, length: { minimum: 10 }
  
  belongs_to :feed
end
