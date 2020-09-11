require "docking_station"

describe DockingStation do
  it 'releases a bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'returns true when asked if bike is working' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

# updated this test, changed it from expect(subject.dock).to respond_to :dock.with(1).argument
# Updated that test to the below.
  it 'expects to respond to dock with 1 argument' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'is expected to respond to a bike instance' do
    expect(subject).to respond_to :bike
  end

  it 'is expected to return a docked bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike 
  end
end
