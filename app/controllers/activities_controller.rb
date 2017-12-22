class ActivitiesController < EventsController

  private
    def scope
      params[:filter].blank? ? Activity.all : Activity.like(params[:filter])
    end

    def event_params
      params.require(:activity).permit(*trusted_parameters)
    end
end
