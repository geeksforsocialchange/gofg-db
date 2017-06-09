json.message "File successfully uploaded"
json.set! :data do
  json.(@upload, :subtype)
  json.name @upload.attachment_file_name
  json.delete_url document_upload_path(@document, @upload)
end
