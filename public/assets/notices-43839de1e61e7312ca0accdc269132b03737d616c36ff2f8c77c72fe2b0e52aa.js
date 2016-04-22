$(".close-button").click(
	function () 
	{
		$(this).parent().velocity(
			{ height: 0 },
			{ duration: 250}
		);
	}
);
