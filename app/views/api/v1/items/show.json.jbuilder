json.data do
  json.id @item.id
  json.title @item.title
  json.slug @item.slug
  json.detail @item.detail
  json.reward @item.reward
  json.time_start @item.time_start
  json.time_end @item.time_end
  json.status @item.status
  json.condition @item.condition
  # json.cover_image_url polymorphic_url(@item.images.cover.image.variant(resize: "300x300"))
  # json.cover_image do
  #   json.url do
  #     json.medium polymorphic_url(@item.images.cover.image.variant(resize: '600x600'))
  #   end
  # end
  # json.images @item.images do |item_image|
  #   json.id item_image.id
  #   json.name item_image.name
  #   json.detail item_image.detail
  #   json.cover item_image.cover
  #   json.url do
  #     json.small polymorphic_url(item_image.image.variant(resize: "150x150"))
  #     json.medium polymorphic_url(item_image.image.variant(resize: "600x600"))
  #     json.original rails_blob_url(item_image.image)
  #   end
  # end
  json.user do
    json.uid @item.user.uid
    json.name @item.user.name
    json.email @item.user.email
    if @item.user.user_detail
      json.phone_number @item.user.user_detail.phone_number
      json.whatsapp_phone_number @item.user.user_detail.whatsapp_phone_number
    end
  end
  json.categories @item.categories do |category|
    json.id category.id
    json.name category.name
  end
  json.related @item.related do |item|
    json.id item.id
    json.title item.title
    json.slug item.slug
    json.detail item.detail
    json.reward item.reward
    json.time_start item.time_start
    json.time_end item.time_end
    json.status item.status
    json.condition @item.condition
    # json.cover_image_url polymorphic_url(item.images.cover.image.variant(resize: "300x300"))
    json.user do
      json.name item.user.name
      json.email item.user.email
    end
  end
end
