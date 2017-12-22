class FieldworksController < EventsController

  private
    def scope
      params[:filter].blank? ? Fieldwork.all : Fieldwork.like(params[:filter])
    end

    def event_params
      params.require(:fieldwork).permit(*trusted_parameters)
    end
end
