class Town < ActiveRecord::Base
  before_validation :load_position
  validates :latitude, :longitude, presence: true
  
  private
  def load_position
    places = Nominatim.search(name).limit(1)
    if places.first
      self.latitude = places.first.lat
      self.longitude = places.first.lon
    end
  end 
end