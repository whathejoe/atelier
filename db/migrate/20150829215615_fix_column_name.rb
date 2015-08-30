class FixColumnName < ActiveRecord::Migration
  def change
  end

  def self.up
    rename_column :users, :password, :password_digest
  end

  def self.down
  	rename_column :users, :password_digest, :password
  end
end
