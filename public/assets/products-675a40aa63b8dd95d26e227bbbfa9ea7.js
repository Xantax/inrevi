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
