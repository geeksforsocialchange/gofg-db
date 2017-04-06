class ActivitiesController < EventsController
  def index
    @events = Activity.all
  end
end
