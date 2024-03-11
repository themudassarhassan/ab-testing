# frozen_string_literal: true

class Analytics < ApplicationRecord
  belongs_to :version

  enum event_type: %w[page_view signup].index_by(&:itself)

  validates :user_uuid, presence: true
end
