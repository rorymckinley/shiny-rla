class Sources < ActiveRecord::Migration
  def self.up
    create_table :sources do |t|
      t.string :filename
      t.datetime :mtime
      t.integer :filesize
    end
  end

  def self.down
    drop_table :sources
  end
end
