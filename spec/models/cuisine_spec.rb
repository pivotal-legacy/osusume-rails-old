require 'rails_helper'

describe Cuisine do
  it 'should be able to be saved with valid attributes' do
    cuisine = Cuisine.create(name: "Italian")
    cuisine.save!
    expect(cuisine.reload.name).to eq("Italian")
  end

  it 'should not save without a name' do
    cuisine = Cuisine.create(name: "")
    expect(cuisine.save).to be_falsey
  end
end
