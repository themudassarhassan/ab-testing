# frozen_string_literal: true

class Analytics < ApplicationRecord
  belongs_to :version, touch: true

  enum event_type: { page_view: 0, signup: 1 }

  validates :user_uuid, presence: true
end
