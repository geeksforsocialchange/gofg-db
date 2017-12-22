class InterviewsController < DocumentsController

  private
    def scope
      params[:filter].blank? ? Interview.all : Interview.like(params[:filter])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:interview).permit(*trusted_parameters)
    end
end
