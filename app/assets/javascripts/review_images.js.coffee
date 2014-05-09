$ ->
  toggleAddLink = ->
    $addLink.toggle fieldsCount <= maxFieldsCount
    return
  fieldsCount = undefined
  maxFieldsCount = 2
  $addLink = $("a.add_nested_fields")
  $(document).on "nested:fieldAdded", ->
    fieldsCount += 1
    toggleAddLink()
    return

  $(document).on "nested:fieldRemoved", ->
    fieldsCount -= 1
    toggleAddLink()
    return

  
  # count existing nested fields after page was loaded
  fieldsCount = $("form .fields").length
  toggleAddLink()
  return

  
