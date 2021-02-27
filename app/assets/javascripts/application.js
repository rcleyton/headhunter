// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

document.addEventListener('DOMContentLoaded', () => {
  const backgroundcolors = {
    notice: "linear-gradient(to right, #00b09b, #96c93d)",
    alert: "#f44336",
    error: "#f44336"
  }

  JSON.parse(document.body.dataset.flashMessages).forEach(flashMessage => {
    const [type, message] = flashMessage;

    Toastify({
      text: message,
      duration: 3000,
      close: true,
      backgroundColor: backgroundcolors[type],
      stopOnFocus: true
    }).showToast();
  });
});