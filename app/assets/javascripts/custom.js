$(function(){
  $(".addGiftLink").click(function(){
    // console.log(this);
    $(".addGiftPanel").show();
  });

  $(".addToCart").click(function(){
    console.log(this);
      var item_id = $(this).attr('item_id');
      // var quantity = $(this).attr('item_id');
      $.ajax({
        url: "/lineitem",
        data: { item_id: item_id, quantity: 1},
        dataType: "json",
        method: "POST"
      })
      .done(function(data){
        console.log(data);
        // use jquery to update the count of items in the cart
        // (in the top nav bar, on the right)
        $("#cartCount").html('hello');

      }
    );

  });





});
