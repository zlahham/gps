# frozen_string_literal: true

describe GPS do
  let(:routes) { GPS::ROUTES }
  let(:a)      { GPS::JUNCTIONS[0] }
  let(:b)      { GPS::JUNCTIONS[1] }
  let(:c)      { GPS::JUNCTIONS[2] }
  let(:d)      { GPS::JUNCTIONS[3] }
  let(:e)      { GPS::JUNCTIONS[4] }
  let(:fake)   { ['X', 'Y', 'Z'] }

  context '#initialize' do
    it 'starts empty' do
      expect(subject).to be_instance_of(GPS)
    end
  end

  context '#find_distance' do
    context 'two junctions' do
      it 'reports back the distance from start to end' do
        expect(subject.find_distance(a, b)).to eq routes[:AB]
      end

      it 'does not report distances for invalid entries' do
        expect(subject.find_distance(fake[0], fake[1])).to eq 'NO SUCH ROUTE'
      end
    end

    context 'more than two junctions' do
      it 'reports back the distance from start to end' do
        expect(subject.find_distance(a, e, b, c, d)).to eq 21
      end

      it 'doesnt respond to broken routes' do
        expect(subject.find_distance(a, e, d)).to eq 'NO SUCH ROUTE'
      end
    end
  end

  context '#lookup_route' do
    it 'reports back the existance of a valid route' do
      expect(subject.lookup_route(a, b)).to eq routes.first
    end

    it 'does not report invalid routes' do
      expect(subject.lookup_route(c, fake[2])).to be_empty
    end
  end

  context '#route_exists' do
    it 'validates the presence of a route' do
      expect(subject.route_exists?(a, b)).to be true
    end

    it 'does not validate the non-presence of a route' do
      expect(subject.route_exists?(a, c)).to be false
    end
  end
end
