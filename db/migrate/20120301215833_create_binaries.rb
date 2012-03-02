class CreateBinaries < ActiveRecord::Migration
  def self.up
    create_table :binaries do |t|
      t.timestamps
    end
  end
  
  def self.down
    drop_table :binaries
  end

end
