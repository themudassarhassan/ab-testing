# frozen_string_literal: true

class ArticlesController < ApplicationController
  def show
    if version_id
      @version = Version.find(version_id)
    else
      @version = Version.sample
      cookies[:tracking_info] = { value: cookie_value, httpOnly: true }
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

  def cookie_value
    JSON.generate(version_id: @version.id, user_uuid: SecureRandom.uuid)
  end
end
