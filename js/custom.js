$(document).ready(function() {
  "use strict";

  // Copy to clipboard script
  // ===============================
  $("#copyButton").on("click", function(event) {

    // These two things will likely be needed if you want to use classes
    // for the copyToClipboard function.
    var buttonPressed = event.target;
    var copyTarget = $(buttonPressed).data("target");

    // Since copyToClipboard is Vanilla.js, we need to convert from jQuery syntax
    // to Vanilla by adding [0] after the $().
    copyToClipboard($("#copyTarget")[0]);
  });

  $("#copyButton2").on("click", function(event) {

    // These two things will likely be needed if you want to use classes
    // for the copyToClipboard function.
    var buttonPressed = event.target;
    var copyTarget = $(buttonPressed).data("target");

    // Since copyToClipboard is Vanilla.js, we need to convert from jQuery syntax
    // to Vanilla by adding [0] after the $().
    copyToClipboard($("#copyTarget2")[0]);
  });


  // NOTE: This is not meant to be secure!
  var password = "learningisfun!";

  // To clear your localStorage for testing: `localStorage.setItem("passwordMatched", "")`
  // To check your localStorage: `localStorage.getItem("passwordMatched")`
  // Or in the chrome settings, clear out "Cookies and other site and plugin data"

  // Automatically show the existing client views if they've entered the password before
  if (localStorage.getItem('passwordMatched') === "true") {
    // $("#passwordSubmitWrapper").addClass("hide");
    $("#admin-access").addClass("hide");
    $("#admin-page").removeClass("hide");
  }

  // Enable the password dialog
  $("#passwordSubmit").on("submit", function (e) {
    e.preventDefault();

    // If the password matches, show the existing client views
    if ($("input[type=password]", e.target).val() == password) {
      $("#passwordSubmitWrapper").addClass("hide");
      $("#admin-access").addClass("hide");
      $("#admin-page").removeClass("hide");

      // In the future, don't show the password prompt, just let them in.
      localStorage.setItem('passwordMatched', true);
    }

    return false;
  });

});

