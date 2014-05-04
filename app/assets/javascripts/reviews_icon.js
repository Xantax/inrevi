$(document).on("click", ".thumbsdown a, .thumbsup a", function() {
    $('.thumbsdown').before('Voted!')
    $('.thumbsdown, .thumbsup').remove()
});
