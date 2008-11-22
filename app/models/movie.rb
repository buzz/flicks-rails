require "rexml/document"
include REXML

class Movie < ActiveRecord::Base
  belongs_to :imdb_entry
  has_many :movie_language_assignments, :dependent => :destroy

  # returns an array of imported movies
  def self.import_from_amc_xml_file(xml_file)
    self.import_from_amc_xml(File.open(xml_file).read)
  end
    
  # returns an array of imported movies
  def self.import_from_amc_xml(xml)
    doc = Document.new xml
    doc.elements.collect('AntMovieCatalog/Catalog/Contents/Movie') do |m|
      movie = Movie.new
      if !m.attribute('Number').nil?
        movie.disk_id = m.attribute('Number').to_s.to_i
      end
      if !m.attribute('OriginalTitle').nil?
        movie.title = m.attribute('OriginalTitle').to_s
      end
      if !m.attribute('Disks').nil?
        movie.disks = m.attribute('Disks').to_s.to_i
      end
      if m.attribute('URL').to_s =~ /([0-9]+)/
        movie.imdb_entry = ImdbEntry.new(:imdb_number => $1)
      end
      if !m.attribute('VideoFormat').nil?
        movie.video_format = m.attribute('VideoFormat').to_s.downcase
      end
      if !m.attribute('AudioFormat').nil?
        if m.attribute('AudioFormat').to_s =~ /mp3/i
          movie.audio_format = 'mp3'
        elsif m.attribute('AudioFormat').to_s =~ /ac3/i
          movie.audio_format = 'ac3'
        else
          movie.audio_format = m.attribute('AudioFormat').to_s.downcase
        end
      end
      if !m.attribute('Source').nil?
        movie.releaser = m.attribute('Source').to_s
      end
      movie
    end
  end
end
