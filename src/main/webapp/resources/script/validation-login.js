$(document).ready(() => {
	$("form").submit(e => {
		e.preventDefault();

		const id = $("#id").val();
		const password = $("#password").val();
		
		let isValid = true;
		
		if (!id) {
			isValid = false;	
			$("#error-msg-id").show();
			$("#id").css("border", "1px solid tomato");
		}

		if (!password) {
			isValid = false;	
			$("#error-msg-password").show();
			$("#password").css("border", "1px solid tomato");
		}
		
		if (isValid)
			e.target.submit();
	});
});