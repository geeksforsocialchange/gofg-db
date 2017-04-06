class MentorsController < PeopleController
  def index
    @people = Mentor.all
  end
end
