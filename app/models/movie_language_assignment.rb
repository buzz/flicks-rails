class MovieLanguageAssignment < ActiveRecord::Base
  belongs_to :movie
  belongs_to :language
  
  validates_presence_of :lang_type, :language, :movie
end
