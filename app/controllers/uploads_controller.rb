class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy, :download]
  before_action :set_document, only: [:create, :destroy]

  # GET /uploads/1
  # GET /uploads/1.json
  def show
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = @document.uploads.new(upload_params)

    respond_to do |format|
      if @upload.update(upload_params)
        format.json { render :show, status: :ok }
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
      else
        format.json { render json: @upload.errors.full_messages, status: :unprocessable_entity }
        format.html { render :edit }
      end
    end
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
    render 'uploads/show', status: :ok, format: :js
  end

  def download
    send_file @upload.attachment.path, filename: @upload.attachment_file_name, type: @upload.attachment_content_type
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    def set_document
      @document = Document.find(params[:document_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:attachment, :subtype)
    end
end
