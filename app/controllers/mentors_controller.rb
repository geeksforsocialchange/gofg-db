class MentorsController < PeopleController

  private
    def scope
      params[:filter].blank? ? Mentor.all : Mentor.like(params[:filter])
    end
   def person_params
     params.require(:mentor).permit(:first_name, :last_name, :nicknames, :tel, :email, :twitter, :is_accreditor, :dob, :notes, :type)
   end
end
