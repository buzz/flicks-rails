class Movie < ActiveRecord::Base
  has_many :imdb_entries, :dependent => :destroy
  has_many :language_assignments, :dependent => :destroy
end
