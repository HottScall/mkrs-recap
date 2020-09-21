require "docking_station"

describe DockingStation do
  DEFAULT_CAPACITY = 20

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'throws an error message when there are no bikes available' do
      bike = Bike.new
      expect{subject.release_bike}.to raise_error "No bikes available"
    end
  end

  describe '#dock' do
    it 'is expected to return a docked bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end

    it 'expects to respond to dock with 1 argument' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'throws an error message when a docking station hits its 20 bike capacity' do
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock Bike.new
      end
      expect{ subject.dock Bike.new }.to raise_error "Docking Station full"
    end
  end

  it 'returns true when asked if bike is working' do
    bike = Bike.new
    expect(bike).to be_working
  end


  it 'is expected to respond to a bike instance' do
    expect(subject).to respond_to :bikes
  end

end
