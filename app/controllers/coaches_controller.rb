class CoachesController < PeopleController

  private
    def scope
      params[:filter].blank? ? Coach.all : Coach.like(params[:filter])
    end

    def person_params
      params.require(:coach).permit(*trusted_parameters)
    end
end
