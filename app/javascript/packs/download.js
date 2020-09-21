$( document ).ready(function() {
  $('a#download_csv').on('click', function(){
    var from = $("#from").val();
    var to = $("#to").val();
    this.href = this.href + "?from=" + from + "&to=" + to
  });
});
