json.(@comments) do |comment|

  json.id comment.id
  json.name comment.user.nickname
  json.avatar comment.user.headimgurl
  json.comment comment.comment
  json.created_at comment.created_at.strftime('%Y-%m-%d %H:%M:%S').to_s

end