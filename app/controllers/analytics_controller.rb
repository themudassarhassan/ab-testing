# frozen_string_literal: true

class AnalyticsController < ApplicationController
  skip_forgery_protection

  def create
    analytics = Analytics.new(analytics_params)
    if analytics.save
      head :ok
    else
      render json: { errors: analytics.errors }, status: :bad_request
    end
  end

  private

  def analytics_params
    params.permit(:event_type).merge(version_id:, user_uuid:)
  end

  def version_id
    tracking_info[:version_id]
  end

  def user_uuid
    tracking_info[:user_uuid]
  end

  def tracking_info
    @tracking_info ||= JSON.parse(cookies[:tracking_info]).with_indifferent_access
  end
end
