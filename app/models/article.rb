class Article < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 3000 }
  validates :material, length: { maximum: 255 }
  validates :language, presence: true, length: { maximum: 100 }
  validates :period, presence: true, length: { maximum: 100 }
end
