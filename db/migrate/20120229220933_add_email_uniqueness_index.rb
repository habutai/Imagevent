class AddEmailUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :users, :email, :unique => true #prevents duplicate immediate entries into the database for class User along the index of email
  end

  def down
    remove_index :users, :email
  end
end
