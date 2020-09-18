require "docking_station"

describe DockingStation do
  describe '#release_bikes' do
    it 'releases a bike' do
      bikes = Bike.new
      subject.dock(bikes)
      expect(subject.release_bikes).to eq bikes
    end

    it 'throws an error message when there are no bikes available' do
      bike = Bike.new
      expect{subject.release_bikes}.to raise_error "No bikes available"
    end
  end

  describe '#dock' do
    it 'is expected to return a docked bike' do
      bikes = Bike.new
      subject.dock(bikes)
      expect(subject.bikes).to eq bikes
    end

    it 'expects to respond to dock with 1 argument' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it 'throws an error message when a docking station already contains a bike' do
      subject.dock(Bike.new)
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
