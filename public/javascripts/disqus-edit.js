var DisqusEdit = {
  init: function() {
    TSEditor.registerOnEdit('disqus', function(el) { DisqusEdit.instantiate(el); });
  },
  instantiate: function(el) {
    
  }
}
DisqusEdit.init();