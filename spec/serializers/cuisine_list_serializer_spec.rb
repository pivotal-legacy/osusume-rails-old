require 'rails_helper'

describe CuisineListSerializer do
  it "serializes cuisine data" do
    current_time = Time.current
    cuisines = [
        Cuisine.new(
            id: 1,
            name: "Indian",
            created_at: current_time
        )
    ]

    selializer = CuisineListSerializer.new(cuisines)
    json = selializer.as_json

    expect(json.count).to eq 1
    first_cuisine = json.first
    expect(first_cuisine["id"]).to eq 1
    expect(first_cuisine["name"]).to eq "Indian"
  end
end
