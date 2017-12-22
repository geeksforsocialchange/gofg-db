class MeetingsController < EventsController

  private
    def scope
      params[:filter].blank? ? Meeting.all : Meeting.like(params[:filter])
    end

    def event_params
      params.require(:meeting).permit(*trusted_parameters)
    end
end
