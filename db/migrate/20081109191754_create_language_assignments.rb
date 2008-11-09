class CreateLanguageAssignments < ActiveRecord::Migration
  def self.up
    create_table :language_assignments do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :language_assignments
  end
end
