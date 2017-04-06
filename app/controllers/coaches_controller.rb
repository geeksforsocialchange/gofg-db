class CoachesController < PeopleController
  def index
    @people = Coach.all
  end
end
