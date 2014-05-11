product_ready = ->
  $(".dropdown-menu > li > span.right-caret").on "click", (e) ->
    current = $(this).next()
    grandparent = $(this).parent().parent()
    $(this).toggleClass "right-caret left-caret"  if $(this).hasClass("left-caret") or $(this).hasClass("right-caret")
    grandparent.find(".left-caret").not(this).toggleClass "right-caret left-caret"
    grandparent.find(".sub-menu:visible").not(current).hide()
    current.toggle()
    e.stopPropagation()
    return false

  $(".dropdown-menu > li > a").on "click", ->
    root = $(this).closest(".dropdown")
    root.find(".left-caret").toggleClass "right-caret left-caret"
    root.find(".sub-menu:visible").hide()
    root.toggleClass('open')
    $('form#products_search_path input#category').val($(this).text())
    root.find("a.dropdown-toggle").html($(this).text() + " <span class='caret'></span>")

    url = $('form#products_search_path').attr("action")
    $.ajax
      url: url
      type: 'GET'
      data:
        category: $(this).text()
      success: (data, status, response) ->
        $('table').html(data.products_html)
        $('.pagination-container').html(data.pagination_html)
    return false

$(document).ready(product_ready)
$(document).on('page:load', product_ready)