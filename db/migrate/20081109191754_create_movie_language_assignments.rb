class CreateMovieLanguageAssignments < ActiveRecord::Migration
  def self.up
    create_table :movie_language_assignments do |t|
      t.string :lang_type, :default => 'audio', :null => false
      t.integer :movie_id, :null => false
      t.integer :language_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :movie_language_assignments
  end
end
