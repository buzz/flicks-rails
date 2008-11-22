class Genre < ActiveRecord::Base
  has_and_belongs_to_many :imdb_entries
end
