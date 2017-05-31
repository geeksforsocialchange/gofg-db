class FieldworksController < EventsController
  def index
    @events = Fieldwork.all
  end

  private
    def event_params
      params.require(:fieldwork).permit(:name, :event_start, :event_end, :event_type, :location, :notes, :other_attendee_count, :type)
    end
end
