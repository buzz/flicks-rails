class ImdbEntry < ActiveRecord::Base
  has_many :movie_titles, :dependent => :destroy
  has_many :imdb_language_assignments, :dependent => :destroy
  has_one :movie
end
