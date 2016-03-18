require 'rails_helper'

describe CuisineSerializer do
  it "serializes cuisine data" do
    current_time = Time.current
    cuisine = Cuisine.new(
                id: 1,
                name: "Japanese",
                created_at: current_time
              )


    serializer = CuisineSerializer.new(cuisine)
    json = serializer.as_json

    cuisine = json
    expect(cuisine["id"]).to eq 1
    expect(cuisine["name"]).to eq "Japanese"
  end
 end
