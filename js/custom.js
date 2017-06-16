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

  // Google analytics event tracking
  //https://developers.google.com/analytics/devguides/collection/analyticsjs/events

  // Actions to track:
  // ===================
  //   1. clicked to flip card
  //   2. clicked "learn more" (or "contact me") button

  $('.card .front.face').on('click', function(event) {
    var cardName = $(event.currentTarget).data("cardnamefront")

    // Sends the event to Google Analytics and
    // resubmits the form once the hit is done.
    ga('send', 'event', 'Flip Card', 'front', cardName);
  });

  $('.about-button a').on('click', function(event) {
    var cardName = $(event.currentTarget).data("cardnamebutton")

    ga('send', 'event', 'Flip Card', 'back', cardName);
  });
});


