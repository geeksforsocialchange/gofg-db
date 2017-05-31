class CoachesController < PeopleController
  def index
    @people = Coach.all
  end

  private

    def person_params
      params.require(:coach).permit(:first_name, :last_name, :nicknames, :tel, :email, :twitter, :is_accreditor, :dob, :notes, :type)
    end
end
