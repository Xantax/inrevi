ready = ->
  $("form[data_update_target]").bind "ajax:success", (evt, data) ->
    target = $(this).data("update-target")
    $("#" + target).prepend data
    $('#content').val('')

  score = $('.rating-total').data('score')
  $('.rating-total').raty({
    haftShow: true,
    score: score,
    readOnly: true
  })

$(document).ready(ready)
#$(document).on('page:load', ready)
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