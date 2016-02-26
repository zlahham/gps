# frozen_string_literal: true

class GPS
  ROUTES = { 'AB': 5, 'BC': 4, 'CD': 7,
             'DC': 8, 'DE': 6, 'AD': 5,
             'CE': 2, 'EB': 3, 'AE': 7
           }.freeze

  JUNCTIONS = %w(A B C D E).freeze

  def initialize
    @current_route = {}
  end

  def find_distance(start, jtwo=nil, jthree=nil, jfour=nil, jfive=nil)
    total = 0

    total += lookup_route(start, jtwo).last   if route_exists?(start, jtwo)
    total += lookup_route(jtwo, jthree).last  if route_exists?(jtwo, jthree) && jthree != nil
    total += lookup_route(jthree, jfour).last if route_exists?(jthree, jfour) && jfour != nil
    total += lookup_route(jfour, jfive).last  if route_exists?(jfour, jfive) && jfive != nil
    total
  end

  def lookup_route(start, finish)
    ROUTES.select do |key, _value|
      key == "#{start}#{finish}".to_sym
    end.flatten
  end

  def route_exists?(start, finish)
    if lookup_route(start, finish) == []
      false
    else
      true
    end
  end
end
