// console.log("lala");
// Focuses DIV parent of input
$(":input[type]").parent().click(
	function () {
		$(this).children("input[type]").first().focus(); 
	}
);
// Triggers checkbox when clicking parent div
$(":input[type=checkbox]").parent().click(
	function () {	
		// $(this).children("input[type]").first().attr("checked", "true"); 
		$(this).children("input[type=checkbox]").first().focus();
		$(this).children("input[type=checkbox]").first().trigger("click");
	}
);

// Focuses and triggers checkbox on checkbox click (to circumvent parent click double triggering when on top of checkbox)
$(":input[type=checkbox]").click(
	function () {	
		// $(this).children("input[type]").first().attr("checked", "true"); 
		$(this).focus();
		$(this).trigger("click");
	}
);
// Changes data states of parent divs depending on input values
$(":input[type]").focusin(function(){
	$(this).parent().attr("data-state", "active");
	// $(this).parent().css("background", "#DCEAF1", "border-color", "BBCED8");
	// console.log("focus");
}).focusout(function(){
	if( !$(this).val() ){
		$(this).parent().attr("data-state", "inactive");
		// $(this).parent().css("background", "none");
		// console.log("blur");
	} else if ( $(this).val() ) {
			$(this).parent().attr("data-state", "filled");
			// console.log("filled");
	}
}); 


$(":input[type=checkbox]").parent().addClass("checkbox");
