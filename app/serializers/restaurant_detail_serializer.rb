class RestaurantDetailSerializer
  def initialize(restaurant, current_user_id)
    @restaurant = restaurant
    @current_user_id = current_user_id
  end

  def as_json(*)
    {
        "id" => @restaurant.id,
        "name" => @restaurant.name,
        "liked" => liked_by_current_user?,
        "created_at" => @restaurant.created_at,
        "updated_at" => @restaurant.updated_at,
        "address" => @restaurant.address,
        "cuisine_type" => @restaurant.cuisine_type,
        "cuisine" => CuisineSerializer.new(@restaurant.cuisine).as_json,
        "offers_english_menu" => @restaurant.offers_english_menu,
        "walk_ins_ok" => @restaurant.walk_ins_ok,
        "accepts_credit_cards" => @restaurant.accepts_credit_cards,
        "notes" => @restaurant.notes,
        "user_id" => @restaurant.user_id,
        "user" => UserSerializer.new(@restaurant.user).as_json,
        "comments" => @restaurant.comments.map { |c| CommentSerializer.new(c).as_json },
        "photo_urls" => @restaurant.photo_urls
    }
  end

  def liked_by_current_user?
    likes_of_current_user = @restaurant.likes.to_a.select do |like|
      like.user_id == @current_user_id
    end

    likes_of_current_user.count == 1
  end
end
