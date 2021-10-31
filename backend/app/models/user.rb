# frozen_string_literal: true

class User < ApplicationRecord
  has_many :active_like_actions, class_name: 'Action',
                                 foreign_key: 'owner_id',
                                 inverse_of: :owner,
                                 dependent: :destroy
  has_many :passive_like_actions, class_name: 'Action',
                                  foreign_key: 'liked_id',
                                  inverse_of: :liked,
                                  dependent: :destroy
  has_many :active_pass_actions, class_name: 'Action',
                                 foreign_key: 'owner_id',
                                 inverse_of: :owner,
                                 dependent: :destroy

  has_many :favoriting, through: :active_like_actions, source: :liked
  has_many :favourites, through: :passive_like_actions, source: :owner
  has_many :passing, through: :active_pass_actions, source: :passed

  def like(someone)
    favoriting << someone unless self == someone
  end

  def pass(someone)
    passing << someone unless self == someone
  end
end
