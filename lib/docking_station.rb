require_relative "bike"

class DockingStation

attr_reader :bike

  def release_bike
    Bike.new
  end

# Use an instance variable to store the state of this instance.
  def dock(bike)
    @bike = bike
  end

end
