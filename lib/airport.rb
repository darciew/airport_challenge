require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :grounded_planes, :weather

  def initialize
    @grounded_planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Unable to land: bad weather" if stormy?
    fail "Unable to land: airport full" if full?
    fail "Unable to land: plane already in airport!" if landed?
    @grounded_planes << plane
  end

  def takeoff(_plane)
    fail "Unable to takeoff: bad weather" if stormy?
    fail "Unable to takeoff: no planes in airport" if empty?
    @grounded_planes.shift
    "Plane has taken off"
  end

  def stormy?
    @weather.stormy?
  end

  def full?
    @grounded_planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @grounded_planes.empty?
  end
end
