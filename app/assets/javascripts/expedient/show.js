$("p").each(
	function () {
		if ($(this).html() != "") {
			$(this)
				.parent()
					.attr("data-state", "filled");
		}
		if ($(this).html() == "") {
			$(this)
				.html("Sin datos");
			$(this)
				.css("opacity", ".33");
		}
		if ($(this).html() == "false") {
			$(this)
				.html("No");
		}
		if ($(this).html() == "false") {
			$(this)
				.html("Sí");
		}
	}
);