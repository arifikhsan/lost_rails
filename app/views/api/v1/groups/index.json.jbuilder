json.data @groups do |group|
  json.id group.id
  json.name group.name
  json.username group.username
  json.private group.private
  json.verified group.verified
end
json.pagination do
  json.current_page @groups.current_page
  json.from anchor_from(@groups)
  json.to anchor_to(@groups)
  json.size @groups.size
  json.total_pages @groups.total_pages
  json.next_page @groups.next_page
  json.prev_page @groups.prev_page
  json.is_first_page @groups.first_page?
  json.is_last_page @groups.last_page?
  json.is_out_of_range @groups.out_of_range?
  json.limit @groups.limit_value
  json.total_count @groups.total_count
end

