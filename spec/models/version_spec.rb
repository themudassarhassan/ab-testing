# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Version do
  let(:version) { create(:version) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(version).to be_valid
    end

    it 'is not valid without a content' do
      version.content = nil
      expect(version).to_not be_valid
    end
  end

  context '#click_through_rate' do
    it 'returns 0 if no page views' do
      expect(version.click_through_rate).to eq(0)
    end

    it 'returns the unique click-through rate even when a single user has multiple page views' do
      user_uuid = SecureRandom.uuid

      5.times do
        create(:analytics, version:, event_type: :page_view, user_uuid:)
      end

      create(:analytics, version:, event_type: :signup, user_uuid:)

      expect(version.click_through_rate).to eq(1)
    end

    it 'returns the click through rate for given page views and signups' do
      5.times do
        create(:analytics, version:, event_type: :page_view)
      end

      3.times do
        create(:analytics, version:, event_type: :signup)
      end

      expect(version.click_through_rate).to eq(0.6)
    end

    it 'returns the unique click-through rate even when a single user has multiple signups' do
      user_uuid = SecureRandom.uuid

      create(:analytics, version:, event_type: :page_view, user_uuid:)

      5.times do
        create(:analytics, version:, event_type: :signup, user_uuid:)
      end

      expect(version.click_through_rate).to eq(1)
    end
  end
end
