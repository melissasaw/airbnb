class AddingAttrToListing < ActiveRecord::Migration[5.2]
  def self.up
  	add_column :listings, :place_type, :integer
  	add_column :listings, :property_type, :string
  	add_column :listings, :bed_number, :integer
  	add_column :listings, :country, :string
  	add_column :listings, :state, :string
  	add_column :listings, :zipcode, :string
  	add_column :listings, :address, :string
  end

  def self.down
    remove_column :listings, :place_type
  	remove_column :listings, :property_type
  	remove_column :listings, :bed_number
  	remove_column :listings, :country
  	remove_column :listings, :state
  	remove_column :listings, :zipcode
  	remove_column :listings, :address

  end
end

 