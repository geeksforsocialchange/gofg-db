class InterviewsController < DocumentsController

  private
    def scope
      params[:filter].blank? ? Interview.all : Interview.like(params[:filter])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:name, :document_start, :document_end, :document_type, :location, :notes, :other_attendee_count, :type)
    end
end
