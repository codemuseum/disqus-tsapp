var DisqusApp = {
  init: function() {
    var apps = document.getElementsByTagName('div');
    var account = null;
    for (var i = 0; i < apps.length; ++i) { if (apps[i].className == 'page_object app-disqus') { 
      var div = apps[i].getElementsByTagName('div')[0];
      if (div.className.indexOf('disqus-account-') >= 0) {
        account = div.className.substring('disqus-account-'.length);
      }
    }}
    
    if (account) {
      var links = document.getElementsByTagName('a');
      var query = '?';
      for(var i = 0; i < links.length; ++i) {
        if(links[i].href.indexOf('#disqus_thread') >= 0) {
          query += 'url' + i + '=' + encodeURIComponent(links[i].href) + '&';
        }
      }
      var script = document.createElement("script");
      script.src = document.location.protocol + "//disqus.com/forums/"+account+"/get_num_replies.js" + query;
      script.type="text/javascript";
      document.getElementsByTagName("body")[0].appendChild(script);
    }
  }
}
DisqusApp.init();