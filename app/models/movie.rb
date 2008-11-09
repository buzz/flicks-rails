class Movie < ActiveRecord::Base
  has_many :imdb_entries, :dependent => :destroy
  has_many :audio_languages, :class_name => 'Language'
  has_many :subtitle_languages, :class_name => 'Language'
end
