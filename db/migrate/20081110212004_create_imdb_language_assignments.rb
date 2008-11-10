class CreateImdbLanguageAssignments < ActiveRecord::Migration
  def self.up
    create_table :imdb_language_assignments do |t|
      t.integer :imdb_entry_id, :null => false
      t.integer :language_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :imdb_language_assignments
  end
end
