class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.string :name
      t.text :description
      t.integer :number_of_guests
      t.string :address_name
      t.integer :price_per_night
      t.string :type_of_flat
      t.references :city, foreign_key: true
      t.references :user, foreign_key: true
      t.string :lat
      t.string :long
      t.date :date_check_in
      t.date :date_check_out

      t.timestamps
    end
  end
end
