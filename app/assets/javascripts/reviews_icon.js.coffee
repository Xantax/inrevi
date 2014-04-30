$(document).ready ->
  $(".thumbsdown a, .thumbsup a").on "click", ->
    $(".thumbsdown").before "Voted!"
    $(".thumbsdown, .thumbsup").remove()
    return
