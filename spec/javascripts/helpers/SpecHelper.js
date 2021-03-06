function setup() {
  FBWorld.Helpers.setCookieBasedOnName = function(name, value, options) {
    this.fakeCookie = this.fakeCookie || {};
    this.fakeCookie[name] = value;
  };

  FBWorld.Helpers.getCookieBasedOnName = function(name) {
    this.fakeCookie = this.fakeCookie || {};
    return this.fakeCookie[name];
  };

  FBWorld.setSecret('00000000000000000000000000000000');

  FB.init({
    appId      : '000000000000000',
    status     : true,                     // check login status
    cookie     : true,                     // enable cookies to allow the server to access the session
    xfbml      : false,                    // parse XFBML
    channelUrl : '/facebook/channel.html',
    oauth      : true
  });
}

function apiUnconnectedMessage() {
  return {
    "error": {
      "message": "An active access token must be used to query information about the current user.",
      "type": "OAuthException",
      "code": 2500
    }
  };
}
