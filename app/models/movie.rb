class Movie < ActiveRecord::Base
  has_one :imdb_entry, :dependent => :destroy
  has_many :movie_language_assignments, :dependent => :destroy
end
