class GPS
  ROUTES = {
    'AB': 5,
    'BC': 4,
    'CD': 7,
    'DC': 8,
    'DE': 6,
    'AD': 5,
    'CE': 2,
    'EB': 3,
    'AE': 7
  }.freeze

  def initialize
    @current_route = {}
  end

  def find_distance(start, finish)
    lookup_route(start, finish).last
  end

  def lookup_route(start, finish)
    ROUTES.select { |key, _value| key == "#{start}#{finish}".to_sym }.flatten
  end
end
