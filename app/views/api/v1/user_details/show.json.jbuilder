json.user do
  json.name @user.name
  json.email @user.email
end
json.user_detail do
  json.id @user.id
  json.username @user_detail.username
  # json.address_formatted_address @user_detail.address_formatted_address
  # json.address_street_number @user_detail.address_street_number
  # json.address_street_name @user_detail.address_street_name
  # json.address_street @user_detail.address_street
  # json.address_city @user_detail.address_city
  # json.address_zip_code @user_detail.address_zip_code
  # json.address_department @user_detail.address_department
  # json.address_department_code @user_detail.address_department_code
  # json.address_state @user_detail.address_state
  # json.address_state_code @user_detailaddress_state_code
  # json.address_country @user_detail.address_country
  # json.address_country_code @user_detailaddress_country_code
  # json.address_lat @user_detail.address_lat
  # json.address_lng @user_detail.address_lng
  json.phone_number @user_detail.phone_number
  json.whatsapp_phone_number @user_detail.whatsapp_phone_number
  json.dob @user_detail.dob
  json.gender @user_detail.gender
end
