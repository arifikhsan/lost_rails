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
    json.user do
      json.uid @item.user.uid
      json.name @item.user.name
      json.email @item.user.email
      if @item.user.user_detail
        json.phone_number @item.user.user_detail.phone_number
        json.whatsapp_phone_number @item.user.user_detail.whatsapp_phone_number
      end
    end
    json.category_items @item.category_items do |category_item|
      json.id category_item.id
      json.category_id category_item.category_id
    end
    json.categories @item.categories do |category|
      json.id category.id
      json.name category.name
    end
  end
