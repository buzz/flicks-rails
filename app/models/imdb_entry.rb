require 'open-uri'
require 'hpricot'

class ImdbEntry < ActiveRecord::Base
  has_many :movie_titles, :dependent => :destroy
  has_many :imdb_language_assignments, :dependent => :destroy
  has_one :movie, :dependent => :destroy

  USER_AGENT = 'Mozilla/5.001 (windows; U; NT4.0; en-us) Gecko/25250101'
  IMDB_URL = 'http://www.imdb.com/'
  IMDB_AKAS_URL = 'http://akas.imdb.com/'

  def self.remote_find_title(query)
    results = []
    open("#{IMDB_URL}find?q=#{CGI::escape(query)};s=tt", "User-Agent" => USER_AGENT) do |f|
      f.read.scan(/<a\shref="\/title\/tt([0-9]{7})\/">([^<]+)<\/a>\s+\(([^)]+)\)/) do |match|
        skip = false
        results.each do |r|
          if r[:id] == match[0].to_i
            skip = true
            break
          end
        end
        results << {:id => match[0].to_i, :title => match[1], :year => match[2]} unless skip
      end
    end
    results
  end

  def self.remote_find_id(imdb_number)
    results = []
    if imdb_number.is_a? Integer
      imdb_number = '%07d' % imdb_number
    elsif imdb_number.is_a? String
      if imdb_number !~ /^\d+$/
        return results
      else
        imdb_number = '%07d' % imdb_number.to_i
      end
    end
    open("#{IMDB_AKAS_URL}title/tt#{imdb_number}/", "User-Agent" => USER_AGENT) do |f|
      if f.read =~ /<title>([^<]+)<\/title>/
        if $1 =~ /^(.+)\s\(([^)]+)\)$/
          results << {:id => imdb_number.to_i, :title => $1, :year => $2}
        end
      end
    end
    results
  end

  # returns % of movies that have an imdb entry associated
  def self.coverage
    ImdbEntry.count(:all)/Movie.count(:all)
  end
end
