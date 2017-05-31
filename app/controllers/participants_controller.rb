class ParticipantsController < PeopleController
  def index
    @people = Participant.all
  end


 private

    def person_params
      params.require(:participant).permit(:first_name, :last_name, :nicknames, :tel, :email, :twitter, :is_accreditor, :dob, :notes, :type)
    end
end
