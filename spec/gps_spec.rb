describe GPS do
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
end
