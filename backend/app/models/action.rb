# frozen_string_literal: true

class Action < ApplicationRecord
  belongs_to :like, class_name: 'User', optional: true
  belongs_to :liked, class_name: 'User', optional: true
  belongs_to :pass, class_name: 'User', optional: true
  belongs_to :passed, class_name: 'User', optional: true
end
