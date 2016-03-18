class CuisineSerializer
  def initialize(cuisine)
    @cuisine = cuisine
  end

  def as_json(*)
    {
        "id" => @cuisine.id,
        "name" => @cuisine.name
    } if @cuisine.present?
  end
end
