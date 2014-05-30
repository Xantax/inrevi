(function() {
  var testAPI;

  testAPI = function() {
    console.log("Welcome!  Fetching your information.... ");
    return FB.api("/me", function(response) {
      return console.log("Good to see you, " + response.name + ".");
    });
  };

  window.fbAsyncInit = function() {
    FB.init({
      appId: "{204839183038354}",
      status: true,
      cookie: true,
      xfbml: true
    });
    return FB.Event.subscribe("auth.authResponseChange", function(response) {
      if (response.status === "connected") {
        return testAPI();
      } else if (response.status === "not_authorized") {
        return FB.login();
      } else {
        return FB.login();
      }
    });
  };

  (function(d) {
    var id, js, ref;
    js = void 0;
    id = "facebook-jssdk";
    ref = d.getElementsByTagName("script")[0];
    if (d.getElementById(id)) {
      return;
    }
    js = d.createElement("script");
    js.id = id;
    js.async = true;
    js.src = "//connect.facebook.net/en_US/all.js";
    return ref.parentNode.insertBefore(js, ref);
  })(document);

}).call(this);
