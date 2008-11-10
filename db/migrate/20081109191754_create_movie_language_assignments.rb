class CreateMovieLanguageAssignments < ActiveRecord::Migration
  def self.up
    create_table :movie_language_assignments do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :movie_language_assignments
  end
end
