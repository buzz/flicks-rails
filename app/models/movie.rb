class Movie < ActiveRecord::Base
  belongs_to :imdb_entry
  has_many :movie_language_assignments, :dependent => :destroy
end
