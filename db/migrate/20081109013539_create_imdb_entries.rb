class CreateImdbEntries < ActiveRecord::Migration
  def self.up
    create_table :imdb_entries do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :imdb_entries
  end
end
