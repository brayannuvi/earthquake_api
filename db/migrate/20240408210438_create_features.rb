class CreateFeatures < ActiveRecord::Migration[7.1]
  def change
    create_table :features do |t|
      t.string :external_id
      t.decimal :magnitude, precision: 2, scale: 1
      t.string :place
      t.string :time
      t.string :external_url
      t.boolean :tsunami
      t.string :mag_type
      t.string :title
      t.decimal :longitude, precision: 3, scale: 1
      t.decimal :latitude, precision: 2, scale: 1

      t.timestamps
    end
  end
end
