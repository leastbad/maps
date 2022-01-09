class Map < ApplicationRecord
  include Plottable
  has_many :listings, dependent: :destroy

  after_commit do
    cable_ready[self]
      .set_dataset_property("#map", name: "mapZoomValue", value: zoom)
      .set_dataset_property("#map", name: "mapLatLngValue", value: "[#{latLng.to_a.join(", ")}]")
      .text_content("#name", text: name)
      .broadcast
  end

  after_destroy do
    cable_ready[self].redirect_to("/maps").broadcast
  end
end
