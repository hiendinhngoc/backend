# frozen_string_literal: true

class User < ApplicationRecord
  has_many :favourites, class_name: 'Action',
                        foreign_key: 'like_id',
                        inverse_of: :user,
                        dependent: :destroy

  has_many :favoriting, through: :favourites, source: :liked
end
