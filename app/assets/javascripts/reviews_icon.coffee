$(document).on "click", ".thumbsdown a, .thumbsup a", ->
  parent = $(this).closest(".separatereview")
  $(".thumbsdown", parent).before "Voted!"
  $(".thumbsdown, .thumbsup", parent).remove()
  return

