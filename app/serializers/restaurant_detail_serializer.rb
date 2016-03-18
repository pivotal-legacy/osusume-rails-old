class RestaurantDetailSerializer
  def initialize(restaurant)
    @restaurant = restaurant
  end

  def as_json(*)
    {
        "id" => @restaurant.id,
        "name" => @restaurant.name,
        "created_at" => @restaurant.created_at,
        "updated_at" => @restaurant.updated_at,
        "address" => @restaurant.address,
        "cuisine_type" => @restaurant.cuisine_type,
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
end
