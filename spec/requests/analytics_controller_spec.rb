# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AnalyticsController, type: :request do
  describe 'POST #create' do
    let!(:version) { create(:version) }
    let!(:cookies) do
      {
        tracking_info: {
          version_id: version.id,
          user_uuid: 'test_uuid'
        }.to_json
      }
    end
    let(:req_params) do
      {
        event_type: 'page_view'
      }
    end

    context 'with valid params' do
      before do
        post '/analytics', params: req_params, headers: { 'Cookie' => cookies.to_query }
      end

      it 'creates an analytic' do
        expect(Analytics.count).to eq(1)
      end

      it 'responds with :ok' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      let(:req_params) do
        {}
      end

      before do
        post '/analytics', params: req_params, headers: { 'Cookie' => cookies.to_query }
      end

      it 'does not create an analytic' do
        expect(Analytics.count).to eq(0)
      end

      it 'responds with :bad_request' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
