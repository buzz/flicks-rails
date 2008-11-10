class Language < ActiveRecord::Base
  has_many :movie_language_assignments, :dependent => :destroy
  has_many :imdb_language_assignments, :dependent => :destroy
  has_many :movie_titles
end
