class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  before_action :set_event, except: [:destroy]
  before_action :set_people, except: [:destroy]

  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = smart_listing_create(:attendances, scope, partial: 'attendances/listing')
    @events = Event.order(:name)
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.js
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.js
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.js
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.js
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id]) if params[:event_id]
    end

    def set_people
      @people = Person.order(:last_name)
    end

    def scope
      if params[:event_id].present?
        Attendance.by_event(params[:event_id])
      elsif params[:person_id].present?
        Attendance.where(person_id: params[:person_id])
      else
        Attendance.all
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:person_id, :event_id, :notes)
    end
end
