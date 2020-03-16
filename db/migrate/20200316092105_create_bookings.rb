class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :number_of_guests
      t.references :flat, foreign_key: true
      t.references :traveller, foreign_key: true
      t.date :date_check_in
      t.date :date_check_out

      t.timestamps
    end
  end
end
