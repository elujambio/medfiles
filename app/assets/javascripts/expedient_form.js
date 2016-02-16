console.log("lala");
$(":input[type=text]").focusin(function(){
	$(this).parent().addClass("expedient__active-field");
	// $(this).parent().css("background", "#DCEAF1", "border-color", "BBCED8");
	console.log("focus");
}).focusout(function(){
	$(this).parent().removeClass();
	// $(this).parent().css("background", "none");
	console.log("blur");
}); 


