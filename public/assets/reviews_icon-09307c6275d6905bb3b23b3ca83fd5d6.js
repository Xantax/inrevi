(function() {
  $(document).on("click", ".thumbsdown a, .thumbsup a", function() {
    var parent;
    parent = $(this).closest(".separatereview");
    $(".thumbsdown", parent).before("Voted!");
    $(".thumbsdown, .thumbsup", parent).remove();
  });

}).call(this);
