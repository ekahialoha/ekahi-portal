class Feed < ApplicationRecord
  validates :name, length: { in: 3..55 }
  validates :url, presence: true, length: { minimum: 10 }

  has_many :articles
end
