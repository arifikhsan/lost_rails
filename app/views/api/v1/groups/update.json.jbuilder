json.data do
  json.id @group.id
  json.name @group.name
  json.username @group.username
  json.private @group.private
  json.verified @group.verified
end
