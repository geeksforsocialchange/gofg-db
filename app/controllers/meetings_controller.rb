class MeetingsController < EventsController

  private
    def scope
      params[:filter].blank? ? Meeting.all : Meeting.like(params[:filter])
    end

    def event_params
      params.require(:meeting).permit(:name, :event_start, :event_end, :event_type, :location, :notes, :other_attendee_count, :type)
    end
end
