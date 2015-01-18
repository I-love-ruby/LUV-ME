$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
    $("#go_login").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" })
    $("#go_signup").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" })
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
