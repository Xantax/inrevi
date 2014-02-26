# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#podcast_podcast_sub_category_id').parent().hide()
  podcast_sub_categories = $('#podcast_podcast_sub_category_id').html()
  $('#podcast_podcast_category_id').change ->
    podcast_category = $('#podcast_podcast_category_id :selected').text()
    escaped_podcast_category = podcast_category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(podcast_sub_categories).filter("optgroup[label='#{escaped_podcast_category}']").html()
    if options
      $('#podcast_podcast_sub_category_id').html(options)
      $('#podcast_podcast_sub_category_id').parent().show()      
    else
      $('#podcast_podcast_sub_category_id').empty()
      $('#podcast_podcast_sub_category_id').parent().hide()