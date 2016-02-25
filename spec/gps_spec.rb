describe GPS do
  let(:routes) { GPS::ROUTES }

  context '#initialize' do
    it 'starts empty' do
      expect(subject).to be_instance_of(GPS)
    end
  end

  context '#find_distance' do
    it 'reports back the distance from start to end' do
      expect(subject.find_distance('A', 'B')).to eq 5
    end
  end

  context '#lookup_route' do
    it 'reports back the existance of a valid route' do
      expect(subject.lookup_route('A', 'B')).to eq routes.first
    end
  end
end
