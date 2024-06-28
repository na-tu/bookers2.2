class Book < ApplicationRecord
belongs_to :user

has_one_attached :image

belongs_to :user
#userモデルとアソシエーション
validates :title, presence: true
validates :body, presence: true, length: { maximum: 200 }
end
