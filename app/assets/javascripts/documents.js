// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//

window.addEventListener("dragover", function(e) {
  e = e || event;
  e.preventDefault();
}, false);

window.addEventListener("drop", function(e) {
  e = e || event;
  e.preventDefault();
}, false);


function uploadSuccess(response) {
  data = response.data
  delLink = "<span class='pull-right'><a data-confirm='Are you sure?' data-remote='true' rel='nofollow' data-method='delete' href='" + data.delete_url + "'>Destroy</a></span>"
  $("#" + data.subtype + "-uploads").append("<li class='list-group-item'>" + data.name + delLink +  "</li>")
}

Dropzone.options.photoUpload = {
  paramName: "upload[attachment]",
  params: { "upload[subtype]": 'photo' },
  dictDefaultMessage: 'Drop photos here to upload',
  acceptedFiles: 'image/*',
  dictInvalidFileType: 'Files must be an image (e.g. png, jpeg, etc.)',
  init: function() {
    this.on("success", function(file, response) {
      uploadSuccess(response)
    });
  }
};

Dropzone.options.transcriptUpload = {
  paramName: "upload[attachment]",
  params: { "upload[subtype]": 'transcript' },
  dictDefaultMessage: 'Drop transcripts here to upload',
  init: function() {
    this.on("success", function(file, response) {
      uploadSuccess(response)
    });
  }
};

Dropzone.options.audioUpload = {
  paramName: "upload[attachment]",
  params: { "upload[subtype]": 'audio' },
  dictDefaultMessage: 'Drop audio here to upload',
  acceptedFiles: '.mp3, .ogg, .wav, .wma, .webm',
  dictInvalidFileType: 'Must be a valid audio file (mp3, ogg, wav, wma, or webm)',
  init: function() {
    this.on("success", function(file, response) {
      uploadSuccess(response)
    });
  }
};

Dropzone.options.outputUpload = {
  paramName: "upload[attachment]",
  params: { "upload[subtype]": 'output' },
  init: function() {
    this.on("success", function(file, response) {
      uploadSuccess(response)
    });
  }
};
