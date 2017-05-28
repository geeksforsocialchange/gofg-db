class MentorsController < PeopleController
  def index
    @people = Mentor.all
  end


  private

   def person_params
     params.require(:mentor).permit(:first_name, :last_name, :nicknames, :tel, :email, :twitter, :is_accreditor, :dob, :notes, :type)
   end
end
