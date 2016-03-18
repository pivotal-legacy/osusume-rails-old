require 'rails_helper'

describe RestaurantListSerializer do
  it "serializes a restaurant" do
    current_time = Time.current
    restaurants = [
        Restaurant.new(
            id: 1,
            name: "Cool Name",
            accepts_credit_cards: true,
            address: "1234 Main Street",
            created_at: current_time,
            cuisine_type: "Creole",
            notes: "Good food",
            offers_english_menu: true,
            user: User.new(id: 999, name: "Person"),
            walk_ins_ok: true,
            photo_urls: [PhotoUrl.new(id: 555, url: "http://example.com/image.png")]
        )
    ]

    serializer = RestaurantListSerializer.new(restaurants)

    json = serializer.as_json

    expect(json.count).to eq 1

    first_restaurant = json.first
    expect(first_restaurant["id"]).to eq 1
    expect(first_restaurant["name"]).to eq "Cool Name"
    expect(first_restaurant["accepts_credit_cards"]).to eq true
    expect(first_restaurant["address"]).to eq "1234 Main Street"
    expect(first_restaurant["cuisine_type"]).to eq "Creole"
    expect(first_restaurant["notes"]).to eq "Good food"
    expect(first_restaurant["offers_english_menu"]).to eq true
    expect(first_restaurant["walk_ins_ok"]).to eq true

    expect(first_restaurant["created_at"]).to eq current_time.to_i
    expect(first_restaurant["user"]).to eq({"name" => "Person"})
    expect(first_restaurant["photo_urls"]).to eq([{"url" => "http://example.com/image.png"}])
  end
end
