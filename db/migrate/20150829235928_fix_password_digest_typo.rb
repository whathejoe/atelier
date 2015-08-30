class FixPasswordDigestTypo < ActiveRecord::Migration
  def self.up
    rename_column :users, :pasword_digest, :password_digest
  end

  def self.down
  	rename_column :users, :password_digest, :pasword_digest
  end
end
