module Plottable
  extend ActiveSupport::Concern

  def coordinates
    "#{latLng.x}, #{latLng.y}"
  end

  def coordinates=(point)
    self.latLng = point.delete("[").delete("]")
  end
end
