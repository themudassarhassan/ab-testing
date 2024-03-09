# frozen_string_literal: true

FactoryBot.define do
  factory :analytics do
    event_type { 'page_view' }
    user_uuid { SecureRandom.uuid }

    association :version
  end
end
