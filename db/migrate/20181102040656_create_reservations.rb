class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
    	t.date :check_in
    	t.date :check_out
    	t.binary :instant_book
    	t.references :user
    	t.references :listing

      t.timestamps
    end
  end
end
