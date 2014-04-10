window.changeImage = (source) ->
    console.log "called changeImage(source)"
    $source = $(source)
    imagePath = $source.attr("src")
    if imagePath && imagePath == "/assets/othericons/thumbsup_off.PNG"
      console.log "thumbsup is currently OFF"
      $source.attr("src", "/assets/othericons/thumbsup_on.PNG")
    else
      console.log "thumbsup is currently ON"
      $source.attr("src", "/assets/othericons/thumbsup_off.PNG")
      
window.toggleImage = (source) ->
    console.log "called changeImage(source)"
    $source = $(source)
    imagePath = $source.attr("src")
    if imagePath && imagePath == "/assets/othericons/thumbsdown_off.PNG"
      console.log "thumbsdown is currently OFF"
      $source.attr("src", "/assets/othericons/thumbsdown_on.PNG")
    else
      console.log "thumbsdown is currently ON"
      $source.attr("src", "/assets/othericons/thumbsdown_off.PNG")