class ParticipantsController < PeopleController

 private

    def scope
      params[:filter].blank? ? Participant.all : Participant.like(params[:filter])
    end

    def person_params
      params.require(:participant).permit(*trusted_parameters)
    end
end
