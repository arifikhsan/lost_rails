json.data @items do |item|
  json.id item.id
  json.title item.title
  json.slug item.slug
  json.detail item.detail
  json.condition item.condition
  json.reward item.reward
  json.time_start item.time_start
  json.time_end item.time_end
  json.latitude item.latitude
  json.longitude item.longitude
  json.radius item.radius

  # json.cover_image_url polymorphic_url(item.images.cover.image.variant(resize: "300x300"))
  # json.images item.images do |item_image|
  #   json.filename item_image.image.blob.filename
  #   json.cover item_image.cover
  #   json.url do
  #     json.small polymorphic_url(item_image.image.variant(resize: "300x300"))
  #     json.original rails_blob_url(item_image.image)
  #   end
  # end
  json.user do
    json.name item.user.name
    # json.email item.user.email
  end
  json.categories item.categories do |category|
    json.id category.id
    json.name category.name
  end
end
json.pagination do
  json.total_pages @items.total_pages
  json.current_page @items.current_page
  json.next_page @items.next_page
  json.prev_page @items.prev_page
  json.is_first_page @items.first_page?
  json.is_last_page @items.last_page?
  json.is_out_of_range @items.out_of_range?
  json.limit @items.limit_value
  json.total_count @items.total_count
end
