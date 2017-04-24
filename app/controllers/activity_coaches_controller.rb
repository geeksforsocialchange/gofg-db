class ActivityCoachesController < ApplicationController
  before_action :set_activity_coach, only: [:show, :edit, :update, :destroy]

  # GET /activity_coaches
  # GET /activity_coaches.json
  def index
    @activity_coaches = ActivityCoach.all
  end

  # GET /activity_coaches/1
  # GET /activity_coaches/1.json
  def show
  end

  # GET /activity_coaches/new
  def new
    if params[:event_id]
      @activity_coach = ActivityCoach.new(event_id: params[:event_id])
    elsif params[:person_id]
      @activity_coach = ActivityCoach.new(person_id: params[:person_id])
    else
      @activity_coach = ActivityCoach.new
    end
  end

  # GET /activity_coaches/1/edit
  def edit
  end

  # POST /activity_coaches
  # POST /activity_coaches.json
  def create
    @activity_coach = ActivityCoach.new(activity_coach_params)

    respond_to do |format|
      if @activity_coach.save
        format.html { redirect_to @activity_coach, notice: 'Activity coach was successfully created.' }
        format.json { render :show, status: :created, location: @activity_coach }
      else
        format.html { render :new }
        format.json { render json: @activity_coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_coaches/1
  # PATCH/PUT /activity_coaches/1.json
  def update
    respond_to do |format|
      if @activity_coach.update(activity_coach_params)
        format.html { redirect_to @activity_coach, notice: 'Activity coach was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_coach }
      else
        format.html { render :edit }
        format.json { render json: @activity_coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_coaches/1
  # DELETE /activity_coaches/1.json
  def destroy
    @activity_coach.destroy
    respond_to do |format|
      format.html { redirect_to activity_coaches_url, notice: 'Activity coach was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_coach
      @activity_coach = ActivityCoach.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_coach_params
      params.require(:activity_coach).permit(:event_id, :person_id)
    end
end
