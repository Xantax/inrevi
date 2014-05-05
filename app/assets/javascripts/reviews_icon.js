$('.thumbsdown a, .thumbsup a').on('click', function() 
{
    var parent = $(this).closest('li');
    $('.thumbsdown', parent).before('You voted');
    $('.thumbsdown, .thumbsup', parent).remove();
})
