//https://www.w3schools.com/bootstrap4/tryit.asp?filename=trybs_ref_js_carousel_js
var bootstrap_link = document.createElement("link");
bootstrap_link["rel"] = "stylesheet";
bootstrap_link["href"] = "https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css";

var script_jquery = document.createElement("script");
script_jquery["src"] = "https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js";

var script_popper = document.createElement("script");
script_jquery["src"] = "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js";

var script_bootstrap = document.createElement("script");
script_jquery["src"] = "https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js";

var css = ".carousel-inner img { width: 100%; height: 100%; }";
var css_element = document.createElement("script");
css_element.type = "text/css";
if (css_element.styleSheet){
	// This is required for IE8 and below.
	css_element.styleSheet.cssText = css;
} else {
	css_element.appendChild(document.createTextNode(css));
}

var head = document.head || document.getElementsByTagName('head')[0];
head.appendChild(bootstrap_link);
head.appendChild(script_jquery);
head.appendChild(script_popper);
head.appendChild(script_bootstrap);
head.appendChild(css_element);

var container = document.createElement("div");
container.className = "container mt-3";

var indicators = document.createElement("ul");
indicators.className = "carousel-indicators";
var item1 = document.createElement("li");
item1.className = "item1 active";
indicators.appendChild(item1);
var item2 = document.createElement("li");
item2.className = "item2";
indicators.appendChild(item2);
var item3 = document.createElement("li");
item3.className = "item3";
indicators.appendChild(item3);
container.appendChild(indicators);

var carousel_inner = document.createElement("div");
var standard1 = document.createElement("div");
var standard2 = document.createElement("div");
var standard3 = document.createElement("div");
carousel_inner.appendChild(standard1);
carousel_inner.appendChild(standard2);
carousel_inner.appendChild(standard3);
container.appendChild(carousel_inner);

var prev_button = document.createElement("a");
prev_button.className = "carousel-control-prev";
prev_button["href"] = "#myCarousel";
var prev_span = document.createElement("span");
prev_span.className = "carousel-control-prev-icon";
prev_button.appendChild(prev_span);
container.appendChild(prev_button);

var next_button = document.createElement("a");
next_button.className = "carousel-control-next";
next_button["href"] = "#myCarousel";
var next_span = document.createElement("span");
next_button.className = "carousel-control-next-icon";
next_button.appendChild(next_span);
container.appendChild(next_button);

$(document).ready(function(){
  // Activate Carousel
  $("#myCarousel").carousel();
    
  // Enable Carousel Indicators
  $(".item1").click(function(){
    $("#myCarousel").carousel(0);
  });
  $(".item2").click(function(){
    $("#myCarousel").carousel(1);
  });
  $(".item3").click(function(){
    $("#myCarousel").carousel(2);
  });
    
  // Enable Carousel Controls
  $(".carousel-control-prev").click(function(){
    $("#myCarousel").carousel("prev");
  });
  $(".carousel-control-next").click(function(){
    $("#myCarousel").carousel("next");
  });
});

var target_location = document.getElementsByClassName("col-lg-7 g-mb-20 g-pr-0");
target_location[0].appendChild(container);