class CreateAmenitiesFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :amenities_flats do |t|
      t.references :amenity, foreign_key: true
      t.references :flat, foreign_key: true

      t.timestamps
    end
  end
end
