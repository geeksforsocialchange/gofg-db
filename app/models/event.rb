class Event < ApplicationRecord
  def duration
    event_end ? (event_end - event_start) / 60 / 60 : 0
  end
end
