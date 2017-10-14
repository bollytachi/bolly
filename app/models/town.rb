class Town < ActiveRecord::Base
  before_validation: load_position
  
  private
  def load_position
    places = Nominatim.search(name).limit(1)
    latitude = places.first.lat
    longitude = places.first.long
end
  
