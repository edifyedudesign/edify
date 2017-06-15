// Google analytics event tracking
//https://developers.google.com/analytics/devguides/collection/analyticsjs/events

// Actions to track:
// ===================
//   1. clicked to flip card
//   2. clicked "learn more" (or "contact me") button

ga('event', {
  hitType: 'event',
  eventCategory: 'flipCards',
  eventAction: 'flip',
  eventLabel: 'Clicked a flip card'
});
// can I have a different label for each card? ... maybe by ID?
// more info about this: https://support.google.com/analytics/answer/1033068