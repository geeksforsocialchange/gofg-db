class ActivitiesController < EventsController
  def index
    @events = Activity.all
  end

  private
    def event_params
      params.require(:activity).permit(:name, :event_start, :event_end, :event_type, :location, :notes, :other_attendee_count, :type)
    end
end
