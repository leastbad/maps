class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.string :name
      t.point :latLng, default: "(0,0)"
      t.integer :zoom, default: 10
      t.timestamps
    end
  end
end
