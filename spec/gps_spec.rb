# frozen_string_literal: true

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
    it 'does not report distances for invalid entries' do
      expect(subject.find_distance('X', 'U')).to be false
    end
  end

  context '#lookup_route' do
    it 'reports back the existance of a valid route' do
      expect(subject.lookup_route('A', 'B')).to eq routes.first
    end

    it 'does not report invalid routes' do
      expect(subject.lookup_route('C', 'Q')).to be_empty
    end
  end

  context '#route_exists' do
    it 'validates the presence of a route' do
      expect(subject.route_exists?('A', 'B')).to be true
    end

    it 'does not validate the non-presence of a route' do
      expect(subject.route_exists?('A', 'C')).to be false
    end
  end
end
