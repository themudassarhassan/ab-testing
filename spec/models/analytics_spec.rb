require 'rails_helper'

RSpec.describe Analytics do
  let(:analytics) { create(:analytics) }

  context "validations" do
    it "is valid with valid attributes" do
      expect(analytics).to be_valid
    end

    it "is not valid without a user_uuid" do
      analytics.user_uuid = nil
      expect(analytics).to_not be_valid
    end
  end
end
