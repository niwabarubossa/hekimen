class Production < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :production_title, presence: true, length: { maximum: 255 }
  validates :production_picture, presence: true
  validates :production_information, presence: true, length: { maximum: 500 }
  validates :production_genre, presence: true, length: { maximum: 255 }
  # ↑　ここは変更しなきゃダメ
  validates :production_season, presence: true, length: { maximum: 10 }

  mount_uploader :production_picture, PictureUploader

end
