(function() {
  var ready;

  ready = function() {
    $("form[data-update-target]").bind("ajax:success", function(evt, data) {
      var target;
      target = $(this).data("update-target");
      $("#" + target).prepend(data);
      return $('#content').val('');
    });
    return $('.rating-total').each(function() {
      var score;
      score = $(this).data('score');
      return $(this).raty({
        haftShow: true,
        score: score,
        readOnly: true
      });
    });
  };

  $(document).ready(ready);

  $(document).on('page:load', ready);

}).call(this);
