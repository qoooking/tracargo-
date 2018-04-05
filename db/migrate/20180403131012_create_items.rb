class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.datetime :pickup_date
      t.datetime :landing_date
      t.integer :standby_time
      t.integer :landing_time
      t.integer :unloading_time
      t.string :pickup_place
      t.string :dropoff_place
      
      t.string :cargo_title
      t.integer :cargo_size_length
      t.integer :cargo_size_width
      t.integer :cargo_weight
      t.string :cargo_shape
      t.text :cargo_description
      t.integer :cargo_price

      t.timestamps
    end
  end
end
