require 'pp'
# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


def movies_with_director_key(name, movies_collection)
  
  result = []
  index = 0
  
  while index < movies_collection.length do
    result[index] = movie_with_director_name(name, movies_collection[index])
    index += 1
  end
  
  result
end


def gross_per_studio(collection)
  index = 0
  result = {}

  # Setting up studio hash with studio names
  while index < collection.length do
    if !( result.has_key? 'collection[index][:studio]' )
      result[collection[index][:studio]] = 0
    end
    index += 1
  end
  index = 0

  while index < collection.length do
    result[collection[index][:studio]] += collection[index][:worldwide_gross]
    index += 1
  end
  result
    
end

def movies_with_directors_set(source)
  pp source
  result = []
  
  result
  
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
