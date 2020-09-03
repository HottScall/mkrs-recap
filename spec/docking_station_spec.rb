require "docking_station"

describe DockingStation do
  it 'releases a bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'returns true when asked if bike is working' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'allows bikes to be docked' do
    expect(subject).to respond_to :dock_bike
  end
end
