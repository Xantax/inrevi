(function() {
  window.SocialShareButton = {
    openUrl: function(url) {
      window.open(url);
      return false;
    },
    share: function(el) {
      var get_tumblr_extra, img, site, title, tumblr_params, url;
      site = $(el).data('site');
      title = encodeURIComponent($(el).parent().data('title') || '');
      img = encodeURIComponent($(el).parent().data("img") || '');
      url = encodeURIComponent($(el).parent().data("url") || '');
      if (url.length === 0) {
        url = encodeURIComponent(location.href);
      }
      switch (site) {
        case "email":
          location.href = "mailto:?to=&subject=" + title + "&body=" + url;
          break;
        case "weibo":
          SocialShareButton.openUrl("http://service.weibo.com/share/share.php?url=" + url + "&type=3&pic=" + img + "&title=" + title);
          break;
        case "twitter":
          SocialShareButton.openUrl("https://twitter.com/home?status=" + title + ": " + url);
          break;
        case "douban":
          SocialShareButton.openUrl("http://shuo.douban.com/!service/share?href=" + url + "&name=" + title + "&image=" + img);
          break;
        case "facebook":
          SocialShareButton.openUrl("http://www.facebook.com/sharer.php?u=" + url);
          break;
        case "qq":
          SocialShareButton.openUrl("http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=" + url + "&title=" + title + "&pics=" + img);
          break;
        case "tqq":
          SocialShareButton.openUrl("http://share.v.t.qq.com/index.php?c=share&a=index&url=" + url + "&title=" + title + "&pic=" + img);
          break;
        case "baidu":
          SocialShareButton.openUrl("http://hi.baidu.com/pub/show/share?url=" + url + "&title=" + title + "&content=");
          break;
        case "kaixin001":
          SocialShareButton.openUrl("http://www.kaixin001.com/rest/records.php?url=" + url + "&content=" + title + "&style=11&pic=" + img);
          break;
        case "renren":
          SocialShareButton.openUrl("http://widget.renren.com/dialog/share?resourceUrl=" + url + "&srcUrl=" + url + "&title=" + title + "&pic=" + img + "&description=");
          break;
        case "google_plus":
          SocialShareButton.openUrl("https://plus.google.com/share?url=" + url);
          break;
        case "google_bookmark":
          SocialShareButton.openUrl("https://www.google.com/bookmarks/mark?op=edit&output=popup&bkmk=" + url + "&title=" + title);
          break;
        case "delicious":
          SocialShareButton.openUrl("http://www.delicious.com/save?url=" + url + "&title=" + title + "&jump=yes&pic=" + img);
          break;
        case "plurk":
          SocialShareButton.openUrl("http://www.plurk.com/?status=" + title + ": " + url + "&qualifier=shares");
          break;
        case "pinterest":
          SocialShareButton.openUrl("http://www.pinterest.com/pin/create/button/?url=" + url + "&media=" + img + "&description=" + title);
          break;
        case "tumblr":
          get_tumblr_extra = function(param) {
            var cutom_data;
            cutom_data = $(el).attr("data-" + param);
            if (cutom_data) {
              return encodeURIComponent(cutom_data);
            }
          };
          tumblr_params = function() {
            var params, path, quote, source;
            path = get_tumblr_extra('type') || 'link';
            params = (function() {
              switch (path) {
                case 'text':
                  title = get_tumblr_extra('title') || title;
                  return "title=" + title;
                case 'photo':
                  title = get_tumblr_extra('caption') || title;
                  source = get_tumblr_extra('source') || img;
                  return "caption=" + title + "&source=" + source;
                case 'quote':
                  quote = get_tumblr_extra('quote') || title;
                  source = get_tumblr_extra('source') || '';
                  return "quote=" + quote + "&source=" + source;
                default:
                  title = get_tumblr_extra('title') || title;
                  url = get_tumblr_extra('url') || url;
                  return "name=" + title + "&url=" + url;
              }
            })();
            return "/" + path + "?" + params;
          };
          SocialShareButton.openUrl("http://www.tumblr.com/share" + (tumblr_params()));
      }
      return false;
    }
  };

}).call(this);
(function() {


}).call(this);
(function() {
  $(document).ready(function() {
    $('#query-text-field').autocomplete({
      source: function(request, response) {
        var results;
        results = $.ui.autocomplete.filter($('#tags').data('category'), request.term);
        return response(results.slice(0, 10));
      }
    });
    $('#place-text-field').autocomplete({
      source: function(request, response) {
        var results;
        results = $.ui.autocomplete.filter($('#tags').data('place'), request.term);
        return response(results.slice(0, 10));
      }
    });
    return $('#results-container').simplePagination({
      items_per_page: 10,
      number_of_visible_page_numbers: 5
    });
  });

}).call(this);
(function() {
  var product_ready;

  product_ready = function() {
    $(".dropdown-menu > li > span.right-caret").on("click", function(e) {
      var current, grandparent;
      current = $(this).next();
      grandparent = $(this).parent().parent();
      if ($(this).hasClass("left-caret") || $(this).hasClass("right-caret")) {
        $(this).toggleClass("right-caret left-caret");
      }
      grandparent.find(".left-caret").not(this).toggleClass("right-caret left-caret");
      grandparent.find(".sub-menu:visible").not(current).hide();
      current.toggle();
      e.stopPropagation();
      return false;
    });
    return $(".dropdown-menu > li > a").on("click", function() {
      var root, url;
      root = $(this).closest(".dropdown");
      root.find(".left-caret").toggleClass("right-caret left-caret");
      root.find(".sub-menu:visible").hide();
      root.toggleClass('open');
      $('form#products_search_path input#category').val($(this).text());
      root.find("a.dropdown-toggle").html($(this).text() + " <span class='caret'></span>");
      url = $('form#products_search_path').attr("action");
      $.ajax({
        url: url,
        type: 'GET',
        data: {
          category: $(this).text()
        },
        success: function(data, status, response) {
          $('.showproducts').html(data.products_html);
          return $('.pagination-container').html(data.pagination_html);
        }
      });
      return false;
    });
  };

  $(document).ready(product_ready);

  $(document).on('page:load', product_ready);

}).call(this);
(function() {
  var ready;

  ready = function() {
    $("form[data-update-target]").bind("ajax:success", function(evt, data) {
      var target;
      target = $(this).data("update-target");
      $("#" + target).prepend(data);
      return $('#content').val('');
    });
    return $('.rating-total').each(function() {
      var score;
      score = $(this).data('score');
      return $(this).raty({
        haftShow: true,
        score: score,
        readOnly: true
      });
    });
  };

  $(document).ready(ready);

  $(document).on('page:load', ready);

}).call(this);
(function() {


}).call(this);
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

;
