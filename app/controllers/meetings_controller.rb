class MeetingsController < EventsController
  def index
    @events = Meeting.all
  end
end
