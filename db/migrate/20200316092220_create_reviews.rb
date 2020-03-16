class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :rating
      t.references :flat, foreign_key: true
      t.references :traveller, foreign_key: true

      t.timestamps
    end
  end
end
