class CreateGenresImdbEntries < ActiveRecord::Migration
  def self.up
    create_table :genres_imdb_entries do |t|
      t.integer :imdb_entry_id, :null => false
      t.integer :genre_id, :null => false
    end
  end

  def self.down
    drop_table :genres_imdb_entries
  end
end
