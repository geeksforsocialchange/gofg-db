module DocumentsHelper
  def uploader(type)
    form_tag document_uploads_path(@document), class: 'dropzone', id: "#{type}-upload" do
    end
  end

  def list_uploads(type)
    uploads = @document.uploads.by_subtype(type)
    render 'uploads/list', uploads: uploads, document: @document, type: type
  end
end
