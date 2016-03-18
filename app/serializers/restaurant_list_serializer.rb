class RestaurantListSerializer
  def initialize(restaurants)
    @restaurants = restaurants
  end

  def as_json(*)
    @restaurants.map do |r|
      {
          "id" => r.id,
          "name" => r.name,
          "accepts_credit_cards" => r.accepts_credit_cards,
          "address" => r.address,
          "created_at" => r.created_at,
          "cuisine_type" => r.cuisine_type,
          "cuisine" => CuisineSerializer.new(r.cuisine).as_json,
          "notes" => r.notes,
          "offers_english_menu" => r.offers_english_menu,
          "user" => UserSerializer.new(r.user).as_json,
          "walk_ins_ok" => r.walk_ins_ok,
          "photo_urls" => PhotoUrlListSerializer.new(r.photo_urls).as_json,
      }
    end
  end
end
