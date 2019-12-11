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

