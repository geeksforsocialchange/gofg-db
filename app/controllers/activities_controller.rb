class ActivitiesController < EventsController

  private
    def scope
      params[:filter].blank? ? Activity.all : Activity.like(params[:filter])
    end

    def event_params
      params.require(:activity).permit(:name, :event_start, :event_end, :event_type, :location, :notes, :other_attendee_count, :type, attendances_attributes: { person_id: [] })
    end
end
