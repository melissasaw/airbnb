class AddCityToListings < ActiveRecord::Migration[5.2]
  def self.up
  	add_column :listings, :city, :string
  end

  def self.down
    remove_column :listings, :city

  end
end