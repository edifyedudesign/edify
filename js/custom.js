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
});


