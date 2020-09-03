require_relative "bike"

class DockingStation

  def initialize(bike)
    @bike = bike
  end

  def release_bike
    Bike.new
  end

  def dock_bike
    @bike
  end
end
