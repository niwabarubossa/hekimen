class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :production
  
  
  validates :content, presence: true, length: { maximum: 255 }
end
