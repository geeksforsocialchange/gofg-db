class OutputsController < DocumentsController
  private
    def scope
      params[:filter].blank? ? Output.all : Output.like(params[:filter])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:output).permit(*trusted_parameters)
    end
end
