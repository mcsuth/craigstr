// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

  $(document).ready(function() {
    $('#save').on('click', function() {
      var item = $('.formbox_item').val();
      var low_cost = $('.formbox_lowrange').val().replace(" ","");
      var high_cost = $('.formbox_highrange').val().replace(" ","");
      var location = $('select').val();
      var url = "http://" + location + ".craigslist.org/search/sss?sort=priceasc&catAbb=sss&maxAsk=" + high_cost + "&minAsk=" + low_cost + "&query=" + item.replace(/\s/g, "%20")
      var user_id = $('.formbox_user_id').val();
      $.ajax({
        url: "/create",
        data: {
          item: item,
          low_cost: low_cost,
          high_cost: high_cost,
          location: location,
          url: url,
          user_id: user_id
        },
        type: "PUT"
      })

      $('form').val("");
    })
  })






