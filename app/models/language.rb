class Language < ActiveRecord::Base
  has_many :movie_language_assignments, :dependent => :destroy
  has_many :imdb_language_assignments, :dependent => :destroy
  has_many :movie_titles
  
  validates_uniqueness_of :name
  validates_length_of :name, :minimum => 1
  validate :must_be_lowercase

  def to_s
    name.to_s
  end

  protected
  def must_be_lowercase
    errors.add("name", "must be lowercase") unless name =~ /^[a-z]*$/
  end
end
