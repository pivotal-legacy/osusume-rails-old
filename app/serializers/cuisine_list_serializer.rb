class CuisineListSerializer
  def initialize(cuisines)
    @cuisines = cuisines
  end

  def as_json(*)
    @cuisines.map do |c|
      {
          "id" => c.id,
          "name" => c.name
      }
    end
  end
end
