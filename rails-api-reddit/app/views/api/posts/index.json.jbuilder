json.array!(@posts) do |post|
  json.(post, :id, :title, :body)
  json.user post.user, :id, :username, :email
end