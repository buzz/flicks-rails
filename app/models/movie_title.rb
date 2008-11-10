class MovieTitle < ActiveRecord::Base
  belongs_to :imdb_entry
  belongs_to :language
end
