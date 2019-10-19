$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require "pry"

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0
  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end
  total
end

def list_of_directors(source)
  director_list = []
  director_index = 0
  while director_index < source.length do
    director = source[director_index][:name]
    director_list << director
  director_index += 1
  end
  return director_list
end

def total_gross(source)
  total = 0
  director_list = list_of_directors(source)
  director_total = directors_totals(source)
  #director_list is a array ["Stephen Spielberg", "Russo Brothers"]
  #directors_total is a hash {"Stephen Spielberg"=>1357566430, "Russo Brothers"=>2281002470}
  director_total.each do |key, value|
    if director_list.include?(key)
      total += value
    end
  end
  return total
end

# Write this implementation
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names 
  #(use visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total


