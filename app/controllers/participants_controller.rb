class ParticipantsController < PeopleController

 private

    def scope
      params[:filter].blank? ? Participant.all : Participant.like(params[:filter])
    end

    def person_params
      params.require(:participant).permit(:first_name, :last_name, :nicknames, :tel, :email, :twitter, :is_accreditor, :dob, :notes, :type)
    end
end
