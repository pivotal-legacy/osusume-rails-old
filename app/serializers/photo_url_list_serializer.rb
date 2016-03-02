class PhotoUrlListSerializer
  def initialize(photo_urls)
    @photo_urls = photo_urls
  end

  def as_json
    @photo_urls.map do |photo_url|
      {
          "url" => photo_url.url
      }
    end
  end
end
