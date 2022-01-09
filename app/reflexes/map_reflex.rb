# frozen_string_literal: true

class MapReflex < ApplicationReflex
  def move(latLng)
    Map.find(element.dataset.id).update(latLng: latLng)
    morph :nothing
  end

  def zoom(i)
    Map.find(element.dataset.id).update(zoom: i)
    morph :nothing
  end
end
