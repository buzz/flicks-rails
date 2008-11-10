class CreateMovieTitles < ActiveRecord::Migration
  def self.up
    create_table :movie_titles do |t|
      t.string :title, :null => false
      t.integer :language_id
      t.integer :imdb_entry_id
      t.timestamps
    end
  end

  def self.down
    drop_table :movie_titles
  end
end
