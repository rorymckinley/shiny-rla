class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.integer :first_lineno
      t.integer :last_lineno
    end
  end

  def self.down
    drop_table :requests
  end
end
