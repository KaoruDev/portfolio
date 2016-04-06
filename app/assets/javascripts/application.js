//= require jquery
//= require jquery_ujs
//= require marked
//= require bootstrap-sprockets
//= require date
//= require underscore
//= require highlight.pack.js

window.marked.setOptions({
  highlight: function (code) {
    return window.hljs.highlightAuto(code).value;
  },
});

window.$(function () {
  var email = ['.com', 'kaoruk', '@', 'dev'].reverse().join('');
  window.$('.email').attr('href', 'mailto:' + email).text(email);
});
