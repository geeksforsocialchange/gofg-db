class GalleriesController < DocumentsController

  private
    def scope
      params[:filter].blank? ? Gallery.all : Gallery.like(params[:filter])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:gallery).permit(:name, :researcher, :conducted_at, :location, :notes, :description, :type)
    end
end
