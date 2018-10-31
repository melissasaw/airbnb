class CreateRolesAndVerification < ActiveRecord::Migration[5.2]
  def self.up
  	add_column :listings, :verification, :boolean
  	add_column :users, :customer, :boolean
    add_column :users, :moderator, :boolean
    add_column :users, :superadmin, :boolean
  end

  def self.down
    remove_column :listings, :verification
  	remove_column :users, :customer, :boolean
  	remove_column :users, :moderator, :boolean
  	remove_column :users, :superadmin, :boolean
  end
end
