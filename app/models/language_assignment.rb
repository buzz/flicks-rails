class LanguageAssignment < ActiveRecord::Base
  belongs_to :movie
  belongs_to :language
end
