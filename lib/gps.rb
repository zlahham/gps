# frozen_string_literal: true

class GPS
  ROUTES = { 'AB': 5, 'BC': 4, 'CD': 7,
             'DC': 8, 'DE': 6, 'AD': 5,
             'CE': 2, 'EB': 3, 'AE': 7
           }.freeze

  JUNCTIONS = %w(A B C D E).freeze # Use this in tests

  def initialize
    @total_distance = 0
    @journey_depth = 0
  end

  def find_distance(*junctions)
    @total_distance = 0
    junction_cycle(junctions)
  end

  def lookup_route(start, finish)
    ROUTES.select do |key, _value|
      key == "#{start}#{finish}".to_sym
    end.flatten
  end

  def route_exists?(start, finish)
    lookup_route(start, finish) == [] ? false : true
  end

  def junction_cycle(junctions)
    if junctions.length > 1
      if route_exists?(junctions[0], junctions[1])
        @total_distance += lookup_route(junctions[0], junctions[1]).last
      else
        return 'NO SUCH ROUTE'
      end
      junctions.delete_at(0)
      junction_cycle(junctions)
    else
      @total_distance
    end
  end
end
