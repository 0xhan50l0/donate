class Experience < Donation
  include Mongoid::Document
  include Geocoder::Model::Mongoid  

  field :contact, type: String
  field :coordinates, :type => Array
  field :address               # can also be an IP address

  geocoded_by :address               # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def latitude
    self.coordinates and self.coordinates[0] || nil
  end
  def longtitude
    self.coordinates and self.coordinates[0] || nil
  end
end

