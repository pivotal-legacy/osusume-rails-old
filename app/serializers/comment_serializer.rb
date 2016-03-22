class CommentSerializer
  def initialize(comment)
    @comment = comment
  end

  def as_json(*)
    {
        "id" => @comment.id,
        "content" => @comment.content,
        "user" => UserSerializer.new(@comment.user).as_json,
        "created_at" => @comment.created_at,
        "restaurant_id" => @comment.restaurant_id
    }
  end
end
