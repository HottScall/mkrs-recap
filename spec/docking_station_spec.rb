require "docking_station"

describe DockingStation do
  it 'releases a bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'returns true when asked if bike is working' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'expects to respond to dock with 1 argument' do
    expect(subject).to respond_to(:dock).with(1).argument
  end
end
