class DeleteMagnitudePrecisionAndScaleInFeatures < ActiveRecord::Migration[7.1]
  def change
    change_table :features do |t|
      t.change :magnitude, :decimal, precision: nil, scale: nil
      t.change :longitude, :decimal, precision: nil, scale: nil
      t.change :latitude, :decimal, precision: nil, scale: nil
    end
  end
end