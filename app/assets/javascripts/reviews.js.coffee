# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $("form[data-update-target]").bind "ajax:success", (evt, data) ->
    target = $(this).data("update-target")
    $("#" + target).prepend data
    $('#content').val('')

  score = $('.rating').data('score')
  $('.rating-total').raty({
    haft: true,
    score: score
  })

$(document).ready(ready)
$(document).on('page:load', ready)
#click: (score, evt) ->
  #asin = $(this).data('asin')
  #$.ajax
    #url: '/ratings'
    #type: 'POST'
    #data:
      #music_asin: asin
      #score: score
    #success: (data, status, response) ->
      #$('.total_score').html(data.avg.toFixed(1))