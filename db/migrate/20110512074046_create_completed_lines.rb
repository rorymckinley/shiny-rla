class CreateCompletedLines < ActiveRecord::Migration
  def self.up
    create_table :completed_lines do |t|
      t.references :request
      t.references :source
      t.integer :lineno
      t.float :duration
      t.float :view
      t.float :db
      t.integer :status
      t.string :url
    end
  end

  def self.down
    drop_table :completed_lines
  end
end
