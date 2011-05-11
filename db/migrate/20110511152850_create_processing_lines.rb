class CreateProcessingLines < ActiveRecord::Migration
  def self.up
    create_table :processing_lines do |t|
      t.references :request
      t.references :source
      t.integer :lineno
      t.string :controller
      t.string :action
      t.string :format
      t.string :ip
      t.datetime :timestamp
      t.string :method
    end
  end

  def self.down
    drop_table :processing_lines
  end
end
