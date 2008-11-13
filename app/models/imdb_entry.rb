class ImdbEntry < ActiveRecord::Base
  has_many :movie_titles, :dependent => :destroy
  has_many :imdb_language_assignments, :dependent => :destroy
  has_one :movie, :dependent => :destroy

  # returns % of movies that have an imdb entry associated
  def self.coverage
    ImdbEntry.count(:all)/Movie.count(:all)
  end
end
