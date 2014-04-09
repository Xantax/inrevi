$(function(){
  $(".thumbsup").live('click', function() {
    if ($(this).attr("class") == "thumbsup") {
      this.src = this.src.replace("_off","_on");
    } else {
      this.src = this.src.replace("_on","_off");
    }
    $(this).toggleClass("on");
  });
});