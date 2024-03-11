# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :request do
  describe 'GET #show' do
    let!(:version) { create(:version) }

    context 'when tracking info is present in cookie' do
      before do
        cookies[:tracking_info] = { value: JSON.generate(version_id: version.id), httpOnly: true }.to_json
        get '/article'
      end

      it 'assigns article version present in cookie' do
        expect { get '/article' }.to change(Version, :count).by(0)
      end
    end

    context 'when tracking info is not present in cookie' do
      let(:uuid) { '6d86922a-44d8-4ae0-8995-e925b9710bc9' }
      let(:tracking_info) do
        JSON.generate(version_id: version.id, user_uuid: uuid)
      end

      before do
        allow(SecureRandom).to receive(:uuid).and_return(uuid)
        get '/article'
      end

      it 'sets tracking info cookie' do
        expect(cookies[:tracking_info]).to eq(tracking_info)
      end
    end
  end
end
