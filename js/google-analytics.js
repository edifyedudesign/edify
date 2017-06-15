// Google analytics event tracking
//https://developers.google.com/analytics/devguides/collection/analyticsjs/events

// Actions to track:
// ===================
//   1. clicked to flip card
//   2. clicked "learn more" (or "contact me") button

ga('send', {
  hitType: 'event',
  eventCategory: 'flipCards',
  eventAction: 'flip',
  eventLabel: 'Clicked a flip card'
});
// can I have a different label for each card? ... maybe by ID?
// more info about this: https://support.google.com/analytics/answer/1033068


// or should I be using tag manager? https://support.google.com/tagmanager/answer/6102821?visit_id=1-636331555099914173-4286214961&rd=1

// https://developers.google.com/analytics/devguides/collection/analyticsjs/sending-hits
// &
//https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener

// Gets a reference to the form element, assuming
// it contains the id attribute "signup-form".
// var form = document.getElementById('signup-form');

var flipCards = document.getElementsByClassName('front');

// Adds a listener for the "submit" event.
// form.addEventListener('submit', function(event) {

flipCards.addEventListener('click', function(event) {

  // Prevents the browser from submitting the form
  // and thus unloading the current page.
 // event.preventDefault();

  // Sends the event to Google Analytics and
  // resubmits the form once the hit is done.
  ga('send', 'event', 'Flip Card Clicked', 'click', {
    hitCallback: function() {
      flipCards.click();
    }
  });
});


