class CreateImdbEntries < ActiveRecord::Migration
  def self.up
    create_table :imdb_entries do |t|
      t.string :director
      t.string :writer
      t.string :country
      t.integer :year
      t.string :genre
      t.string :plot
      t.integer :runtime
      t.float :rating
      t.integer :votings
      t.timestamps
    end
  end

  def self.down
    drop_table :imdb_entries
  end
end
