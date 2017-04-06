class FieldworksController < EventsController
  def index
    @events = Fieldwork.all
  end
end
