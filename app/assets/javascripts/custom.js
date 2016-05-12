$(function() {
    $(".addGiftLink").click(function() {
        // console.log(this);
        $(".addGiftPanel").show();
    });

    $(".addToCart").click(function() {
        console.log(this);
        var item_id = $(this).attr('item_id');
        // var quantity = $(this).attr('item_id');
        $.ajax({
                url: "/lineitem",
                data: {
                    item_id: item_id,
                    quantity: 1
                },
                dataType: "json",
                method: "POST"
            })
            .done(function(data) { //it gets added to the right top nav bar
                $("#cartCount").html(data.total_items);
                $("#cartPrice").html(data.total_price);

                updateCart(data.lineitems);
                //displayCart();

            });
        var updateCart = function(lineitems) {
            console.log('updateCart()');
            $('#shoppingCartView').html('');
            //<span class="scHeading">SHOPPING CART</span>');

            var div = '<div class="container scContainer">';
            div += '<div class="row">';

            for (var i = 0; i < lineitems.length; i++) {
                var lineitem = lineitems[i];
                div += '<div class="col-md-3">';

                div += '<div class="lineItem">';
                div += '<div class="title">' + lineitem.item.name + '</div>';
                div += '<img src=' + lineitem.item.image + '> </img>';
                // div += '<div class="titleQuantity">'  +lineitem.quantity + '</div>';
                div += '<div class="titlePrice">' + lineitem.quantity + 'x $' + lineitem.item.price + '</div>';
                div += '</div><!--lineItem--></div><!--col-md-3-->';
            } //end for

            div += '</div></div>';
            
            $('#shoppingCartView').append(div);
        };

        // $("#btnCart").click(function(){
        //   console.log("hi there");
        //   $("#selectedItem").append("<li><%= image_tag @item.image, :class => 'thumb' %></li>");
        //
        // });
        //to display cart
        // $("#idcartDisplay").hide();

        $("btnCart").click(function() {
            $("div#idcartDisplay").show();
        });



    });





});
