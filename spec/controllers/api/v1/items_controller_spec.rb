require 'rails_helper'

RSpec.describe Api::V1::ItemsController do
  describe 'get #index' do
    # it { expect('do').to eq('do') }
    # let(:item) { create(:item) }
    it 'index' do
      # create_list(:item, 15)
      # before { get :index, format: :json }
      get :index, format: :json
      is_expected.to render_template :index
    end

    # it { expect(response).to have_http_status(:ok) }
    # it { is_expected.to render_template :index }
    # it do
    #   binding.pry # get api_v1_items_path
    # end

    # it 'mine' do
    #   get :mine, format: :json
    #   is_expected.to render_template :index
    # end
  end
end
