class CreateStarships < ActiveRecord::Migration[7.0]
  def change
    create_table :starships do |t|
      t.string :name
      t.string :model
      t.string :starship_class
      t.string :manufacturer
      t.integer :length
      t.integer :passangers
      t.integer :max_speed
      t.integer :hyperdrive_rating
      t.integer :price
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
