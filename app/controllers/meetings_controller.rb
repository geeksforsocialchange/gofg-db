class MeetingsController < EventsController
  def index
    @events = Meeting.all
  end

  private
    def event_params
      params.require(:meeting).permit(:name, :event_start, :event_end, :event_type, :location, :notes, :other_attendee_count, :type)
    end
end
