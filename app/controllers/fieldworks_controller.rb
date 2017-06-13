class FieldworksController < EventsController

  private
    def scope
      params[:filter].blank? ? Fieldwork.all : Fieldwork.like(params[:filter])
    end

    def event_params
      params.require(:fieldwork).permit(:name, :event_start, :event_end, :event_type, :location, :notes, :other_attendee_count, :type)
    end
end
