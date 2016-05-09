$(".close-button").click(
	function () 
	{
		$(this).parent().velocity(
			{ height: 0, marginTop: 0, marginBottom: 0, paddingTop: 0, paddingBottom: 0 },
			{ duration: 250 }
		);
	}
);