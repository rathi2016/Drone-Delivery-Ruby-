require 'pry'
require_relative './url_required.rb'

class Drone_Delivery
    include UrlPath

  # Given depo is  303 Collins Street, Melbourne, VIC 3000
  # Lets convert that into latitude & logitude
  @depo = { latitude: -37.816664, longitude: 144.963848 }
  # Drone Speed given =50km/h
  @drone_speed = 50
  # helper function to convert numeric degree into radians
  def toRand(value)
    value * (Math::PI/180)
  end
  # Helper function to get distance in kilometer between two given sets of co-ordinates
  # Which accepts two arguments, Origin(o) and EndPoint(ep) that are objects containing latitude and logitude.
  def distance_between(o, ep)
  # Radius of the earth in km
    @r = 6371
    lat1_rad = toRand(o[:"latitude" ])
    lat2_rad = toRand(ep[:"latitude" ])
    lon1_rad = toRand(o[:"longitude"])
    lon2_rad = toRand(ep[:"longitude"])
    a = Math.sin((lat2_rad - lat1_rad) / 2) ** 2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin((lon2_rad - lon1_rad) / 2) ** 2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))
   @r * c
  end
end

drone = Drone_Delivery.new