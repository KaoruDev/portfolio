!function () {
  window.utils = window.utils || {};

  _.templateSettings = {
    interpolate: /\{\{(.+?)\}\}/g
  };

  var imageClassHook = function (text) {
    var matches = text.match(/\{(\S*)\}/);
    if (matches) {
      text = text.replace(matches[0], '');
      text = text.replace(/\/>/, 'class="' + matches[1] + '" />');
    }
    return text;
  };

  var timer;

  var initHightlights = function (text) {
    if (timer) {
      clearTimeout(timer);
    }

    timer = setTimeout(function () {
      $('pre code').each(function(i, block) {
         hljs.highlightBlock(block);
       });
    }, 100);

    return text;
  };

  utils.setupMarkdownHooks = function (converter) {
    converter.hooks.chain('postSpanGamut', imageClassHook);
    converter.hooks.chain('postConversion', initHightlights);
  };

} ();
