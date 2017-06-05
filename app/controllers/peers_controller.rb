class PeersController < ApplicationController
  before_action :set_peer, only: [:show, :edit, :update, :destroy]

  # GET /peers
  # GET /peers.json
  def index
    scope = params[:filter].blank? ? Peer.all : Peer.by_mentor(params[:filter])
    @peers = smart_listing_create(:peers, scope, partial: 'peers/listing')
    @mentors = Mentor.order(:last_name)
  end

  # GET /peers/1
  # GET /peers/1.json
  def show
  end

  # GET /peers/new
  def new
    @peer = Peer.new
  end

  # GET /peers/1/edit
  def edit
  end

  # POST /peers
  # POST /peers.json
  def create
    @peer = Peer.new(peer_params)

    respond_to do |format|
      if @peer.save
        format.html { redirect_to @peer, notice: 'Peer was successfully created.' }
        format.json { render :show, status: :created, location: @peer }
      else
        format.html { render :new }
        format.json { render json: @peer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peers/1
  # PATCH/PUT /peers/1.json
  def update
    respond_to do |format|
      if @peer.update(peer_params)
        format.html { redirect_to @peer, notice: 'Peer was successfully updated.' }
        format.json { render :show, status: :ok, location: @peer }
      else
        format.html { render :edit }
        format.json { render json: @peer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peers/1
  # DELETE /peers/1.json
  def destroy
    @peer.destroy
    respond_to do |format|
      format.html { redirect_to peers_url, notice: 'Peer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peer
      @peer = Peer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def peer_params
      params.require(:peer).permit(:participant_id, :mentor_id, :peer_start, :peer_end, :notes)
    end
end
