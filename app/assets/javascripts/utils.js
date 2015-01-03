!function () {
  window.utils = window.utils || {};

  _.templateSettings = {
    interpolate: /\{\{(.+?)\}\}/g
  };

  utils.Markdown = utils.Markdown || {};

  utils.Markdown.imageClassHook = function (text) {
    var matches = text.match(/\{(\S*)\}/);
    if (matches) {
      text = text.replace(matches[0], '');
      text = text.replace(/\/>/, 'class="' + matches[1] + '" />');
    }
    return text;
  };

} ();
