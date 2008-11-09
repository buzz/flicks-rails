class Language < ActiveRecord::Base
  has_many :language_assignments, :dependent => :destroy
end
