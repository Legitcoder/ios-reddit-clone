json.array!(@post_comments) do |comment|
  json.(comment, :id, :body)
  json.user comment.user, :id, :username, :email
end