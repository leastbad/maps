class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.references :map, null: false, foreign_key: true
      t.string :name
      t.point :latLng, default: "(0,0)"
      t.timestamps
    end
  end
end
