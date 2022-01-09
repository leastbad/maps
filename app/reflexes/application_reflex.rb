# frozen_string_literal: true

class ApplicationReflex < StimulusReflex::Reflex
  delegate :session_id, to: :connection
end
