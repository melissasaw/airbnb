class AddingClearanceField < ActiveRecord::Migration[5.2]
  def self.up
  	add_column :users, :first_name, :string
    add_index :users, :first_name
    add_column :users, :last_name, :string
    add_index :users, :last_name
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :last_name
  end
end