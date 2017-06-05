class CoachesController < PeopleController

  private
    def scope
      params[:filter].blank? ? Coach.all : Coach.like(params[:filter])
    end

    def person_params
      params.require(:coach).permit(:first_name, :last_name, :nicknames, :tel, :email, :twitter, :is_accreditor, :dob, :notes, :type)
    end
end
