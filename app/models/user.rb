class User < ApplicationRecord

  has_many :favourites, class_name: 'Action',
                        foreign_key: 'like_id',
                        dependent: :destroy

  has_many :favoriting, through: :favourites, source: :liked
end
