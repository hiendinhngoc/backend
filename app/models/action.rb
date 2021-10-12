# frozen_string_literal: true

class Action < ApplicationRecord
  belongs_to :like, class_name: 'User'
  belongs_to :liked, class_name: 'User'
end
