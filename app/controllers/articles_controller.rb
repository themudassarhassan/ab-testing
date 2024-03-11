# frozen_string_literal: true

class ArticlesController < ApplicationController
  def show
    if version_id
      @version = Version.find(version_id)
    else
      @version = Version.order('Random()').limit(1).first
      cookie_value = { version_id: @version.id, user_uuid: SecureRandom.uuid }
      cookies[:tracking_info] = { value: JSON.generate(cookie_value), httpOnly: true }
    end
  end

  private

  def version_id
    tracking_info[:version_id]
  end

  def tracking_info
    return {} unless cookies[:tracking_info]

    JSON.parse(cookies[:tracking_info]).with_indifferent_access
  end
end
