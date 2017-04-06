class ParticipantsController < PeopleController
  def index
    @people = Participant.all
  end
end
