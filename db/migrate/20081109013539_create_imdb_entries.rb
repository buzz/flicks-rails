class CreateImdbEntries < ActiveRecord::Migration
  def self.up
    create_table :imdb_entries do |t|
      t.integer :imdb_number, :null => false, :unique => true
      t.string :director
      t.string :writer
      t.string :country
      t.integer :year
      t.string :plot
      t.integer :runtime
      t.float :rating
      t.integer :votings
      t.datetime :synced_at
      t.timestamps
    end
  end

  def self.down
    drop_table :imdb_entries
  end
end
