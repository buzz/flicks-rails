class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :title
      t.integer :imdb_entry_id
      t.string :video_format
      t.string :audio_format
      t.integer :disks
      t.integer :disk_id
      t.string :releaser
      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
