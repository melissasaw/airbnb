class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
		t.string :title
		t.string :description
		t.integer :occupant
		t.float :price
		t.binary :images
		t.boolean :pet
		t.boolean :smoker
		t.integer :rooms
		t.integer :toilets
		t.references :user

		t.timestamps
    end
  end
end
