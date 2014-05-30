(function() {
  $(document).ready(function() {
    $('#query-text-field').autocomplete({
      source: function(request, response) {
        var results;
        results = $.ui.autocomplete.filter($('#tags').data('category'), request.term);
        return response(results.slice(0, 10));
      }
    });
    $('#place-text-field').autocomplete({
      source: function(request, response) {
        var results;
        results = $.ui.autocomplete.filter($('#tags').data('place'), request.term);
        return response(results.slice(0, 10));
      }
    });
    return $('#results-container').simplePagination({
      items_per_page: 10,
      number_of_visible_page_numbers: 5
    });
  });

}).call(this);
