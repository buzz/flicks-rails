require "rexml/document"
include REXML

class Movie < ActiveRecord::Base
  belongs_to :imdb_entry
  has_many :languages, :class_name => 'MovieLanguageAssignment', :dependent => :destroy
  has_many :audio_languages, :through => :languages, :source => 'language', :conditions => ['lang_type = ?', 'audio'], :dependent => :destroy
  has_many :subtitles_languages, :through => :languages, :source => 'language', :conditions => ['lang_type = ?', 'subtitles'], :dependent => :destroy

  # returns an array of imported movies
  def self.import_from_amc_xml_file(xml_file)
    self.import_from_amc_xml(File.open(xml_file).read)
  end

  # assign audio language
  def assign_audio_language(lang)
    language = nil
    assignment = MovieLanguageAssignment.new(:movie => self, :lang_type => 'audio')
    if lang.is_a? String
      if ! language = Language.find_by_name(lang)
        language = Language.new(:name => lang)
      end
      assignment.language = language
    elsif lang.is_a? Language
      assignment.language = lang
    end
    if assignment.save!
      save!
    end
  end
  
  # assign subtitles language
  def assign_subtitles_language(lang)
    language = nil
    assignment = MovieLanguageAssignment.new(:movie => self, :lang_type => 'subtitles')
    if lang.is_a? String
      if ! language = Language.find_by_name(lang)
        language = Language.new(:name => lang)
      end
      assignment.language = language
    elsif lang.is_a? Language
      assignment.language = lang
    end
    if assignment.save!
      save!
    end
  end
  
  # returns an array of imported movies
  def self.import_from_amc_xml(xml)
    doc = Document.new xml
    doc.elements.collect('AntMovieCatalog/Catalog/Contents/Movie') do |m|
      movie = Movie.new
      # disk id
      if !m.attribute('Number').nil?
        movie.disk_id = m.attribute('Number').to_s.to_i
      end
      # title
      if !m.attribute('OriginalTitle').nil?
        movie.title = m.attribute('OriginalTitle').to_s
      end
      # no. disks
      if !m.attribute('Disks').nil?
        movie.disks = m.attribute('Disks').to_s.to_i
      end
      # imdb #
      if m.attribute('URL').to_s =~ /([0-9]+)/
        movie.imdb_entry = ImdbEntry.new(:imdb_number => $1)
      end
      # video format
      if !m.attribute('VideoFormat').nil?
        movie.video_format = m.attribute('VideoFormat').to_s.downcase
      end
      # audio format
      if !m.attribute('AudioFormat').nil?
        if m.attribute('AudioFormat').to_s =~ /mp3/i
          movie.audio_format = 'mp3'
        elsif m.attribute('AudioFormat').to_s =~ /ac3/i
          movie.audio_format = 'ac3'
        else
          movie.audio_format = m.attribute('AudioFormat').to_s.downcase
        end
      end
      # audio languages
      if !m.attribute('Languages').nil?
        lang_names = m.attribute('Languages').to_s.downcase
        if lang_names =~ /.+\/.+/
          lang_names.split('/').each do |lang_name|
            movie.assign_audio_language(lang_name)
          end
        else
          movie.assign_audio_language(lang_names)
        end
      end
      # subtitle languages
      if !m.attribute('Subtitles').nil?
        lang_names = m.attribute('Subtitles').to_s.downcase
        if lang_names =~ /.+\/.+/
          lang_names.split('/').each do |lang_name|
            movie.assign_subtitles_language(lang_name)
          end
        else
          movie.assign_subtitles_language(lang_names)
        end
      end
      # releaser
      if !m.attribute('Source').nil?
        movie.releaser = m.attribute('Source').to_s
      end
      movie
    end
  end
end
