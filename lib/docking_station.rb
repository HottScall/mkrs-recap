require_relative "bike"

class DockingStation

attr_reader :bikes

  def release_bikes
    fail "No bikes available" unless @bikes
    @bikes
  end

# Use an instance variable to store the state of this instance.
  def dock(bikes)
    fail "Docking Station full" if @bikes
    @bikes = bikes
  end

end
