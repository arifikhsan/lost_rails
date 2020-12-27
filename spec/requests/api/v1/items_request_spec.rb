require 'rails_helper'

RSpec.describe 'GET /api/v1/items' do
  it 'ok' do
    create_list(:item, 5)
    get '/api/v1/items'

    expect(response).to have_http_status(:ok)
    expect(json_body['data'].size).to eq(5)
    expect(json_body['pagination']).to eq(
      { 'current_page' => 1,
        'from' => 1,
        'to' => 5,
        'size' => 5,
        'total_pages' => 1,
        'next_page' => nil,
        'prev_page' => nil,
        'is_first_page' => true,
        'is_last_page' => true,
        'is_out_of_range' => false,
        'limit' => 25,
        'total_count' => 5 }
    )
  end
end

RSpec.describe 'GET /api/v1/items/{id}' do
  it 'ok' do
    item = create(:item)
    get "/api/v1/items/#{item.slug}"
    data = json_body['data']

    expect(response.status).to eq 200
    expect(Item.first.title).to eq item.title
    expect(data.include?('user')).to be true
    expect(data.include?('categories')).to be true
    expect(data.include?('related')).to be true
  end
end
