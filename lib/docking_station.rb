require_relative "bike"

class DockingStation

attr_reader :bike

  def release_bike
    fail "No bikes available" unless @bike
    @bike
  end

# Use an instance variable to store the state of this instance.
  def dock(bike)
    fail "Docking Station full" if @bike
    @bike = bike
  end

end
