# frozen_string_literal: true

class Version < ApplicationRecord
  validates :content, presence: true

  def click_through_rate
    number_of_page_views.positive? ? number_of_clicks / number_of_page_views.to_f : 0
  end

  private

  def number_of_page_views
    @number_of_page_views ||= Analytics.where(event_type: :page_view, version: self).distinct.count(:user_uuid)
  end

  def number_of_clicks
    Analytics.where(event_type: :signup, version: self).distinct.count(:user_uuid)
  end
end
