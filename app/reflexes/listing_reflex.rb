# frozen_string_literal: true

class ListingReflex < ApplicationReflex
  def create(latLng)
    Map.find(element.dataset.id).listings.create(name: Faker::Company.name, latLng: latLng)
    morph :nothing
  end
end
