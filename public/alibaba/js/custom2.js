(function($) {
    'use strict'

    $(document).ready(function() {
        $(".small_img").hover(function() {
            $(".big_img").attr('src', $(this).attr('src'));
        });
    });

    $(document).ready(function() {
        $(".m-img").on('click', function() {
            $(".big_img").attr('src', $(this).attr('src'));
        });
    });

    $(document).ready(function() {
        $(".big_img").imagezoomsl({
            zoomrange: [3, 3]
        });
    });


    //setting default attribute to disabled of minus button
    document.querySelector(".minus-btn").setAttribute("disabled", "disabled");

    //taking value to increment decrement input value
    var valueCount

    //taking price value in variable
    var price = document.getElementById("price").innerText;


    //plus button
    document.querySelector(".plus-btn").addEventListener("click", function() {

        //getting value of input
        valueCount = $("#quantity").val();
        alert(valueCount);
        //input value increment by 1
        valueCount++;

        //setting increment input value
        $("#quantity").val(valueCount)

        //calling price function
    });

})(jQuery);
