class Listing < ApplicationRecord
  include Plottable
  belongs_to :map

  after_commit do
    cable_ready[map]
      .set_dataset_property("#map", name: "mapListingsValue", value: map.listings.plotted)
      .broadcast
  end

  scope :plotted, -> do
    Jbuilder.encode do |json|
      json.array! self do |listing|
        json.name listing.name
        json.latLng [listing.latLng.x, listing.latLng.y]
      end
    end
  end
end
