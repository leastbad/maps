class ApplicationRecord < ActiveRecord::Base
  include CableReady::Broadcaster
  self.abstract_class = true
end
