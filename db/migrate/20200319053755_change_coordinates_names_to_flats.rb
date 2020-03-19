class ChangeCoordinatesNamesToFlats < ActiveRecord::Migration[5.2]
  def change
      change_table :flats do |t|
      t.remove :lat, :long
      t.float :latitude
      t.float :longitude
    end
  end
end
