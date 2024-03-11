# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Analytics do
  let(:analytics) { create(:analytics) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(analytics).to be_valid
    end

    it 'is not valid without a user_uuid' do
      analytics.user_uuid = nil
      expect(analytics).not_to be_valid
    end

    it 'is not valid without a event_type' do
      analytics.event_type = nil
      expect(analytics).not_to be_valid
    end
  end
end
