class ChangeCoordinatesToFlats < ActiveRecord::Migration[5.2]
  def change
    change_table :flats do |t|
      t.remove :lat, :long
      t.float :lat
      t.float :long
    end
  end
end
