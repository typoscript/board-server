$(document).ready(() => {
	function handleFocusout(id, pattern = null) {
		const value = $(`#${id}`).val();
		if (value) {
			$(`#error-msg-${id}`).hide();
			$(`#${id}`).css("border", "1px solid gray");
			
			if (pattern === null)
				return;

			if (value.match(pattern) === null) {
				$(`#error-msg-${id}-validation`).show();
				$(`#${id}`).css("border", "1px solid tomato");
			} else {
				$(`#error-msg-${id}-validation`).hide();
			}
		} else {
			$(`#error-msg-${id}`).show();
			$(`#${id}`).css("border", "1px solid tomato");
		}
	}
	
	function getBirthPattern() {
		return /\d{8}/;
	}
	
	function getPhonePattern() {
		return /\d{3}-\d{4}-\d{4}/;
	}

	$("#id").focusout(e => handleFocusout("id"));
	$("#password").focusout(e => handleFocusout("password"));
	$("#email").focusout(e => handleFocusout("email"));

	$("#name").focusout(e => handleFocusout("name"));
	$("#birthDate").focusout(e => handleFocusout("birthDate", getBirthPattern()));
	$("#telecom").focusout(e => handleFocusout("telecom"));

	$("#phone").focusout(e => handleFocusout("phone", getPhonePattern()));
	$("#agree").focusout(e => handleFocusout("agree"));
	
	$("input[name=gender]").focusout(e => {
		if ($("input[name=gender").val())	 {
			$(`#error-msg-gender`).hide();
			$("input[name=gender").css("border", "1px solid gray");
		} else {
			$(`#error-msg-gender`).show();
			$("input[name=gender").css("border", "1px solid tomato");
		}
	});

	$("input[name=gender]").on("click", e => {
		$("#label-male").css("border", "1px solid gray");
		$("#label-female").css("border", "1px solid gray");
		$(`#label-${e.currentTarget.id}`).css("border", "1px solid green");
		$(`#error-msg-gender`).hide();
	});

	$("input[name=country]").on("click", e => {
		$("#label-non-foreigner").css("border", "1px solid gray");
		$("#label-foreigner").css("border", "1px solid gray");
		$(`#label-${e.currentTarget.id}`).css("border", "1px solid green");
		$(`#error-msg-country`).hide();
	});

	$("form").submit(e => {
		e.preventDefault();
	
		const id = $("#id").val();
		const password = $("#password").val();
		const email = $("#password").val();

		const name = $("#name").val();
		const birthDate = $("#birthDate").val();
		const telecom = $("#telecom").val();

		const gender = $("input[name=gender]:checked").val();
		const country = $("input[name=country]:checked").val();
		
		const phone = $("#phone").val();
		const isAgreed = $("#agree").is(":checked");
		
		let isValid = true;
		
		if (!id) {
			$("#error-msg-id").show();
			$("#id").css("border", "1px solid tomato");
			isValid = false;
		} else {
			$("#error-msg-id").hide();
		}

		if (!password) {
			$("#error-msg-password").show();
			$("#password").css("border", "1px solid tomato");
			isValid = false;
		} else {
			$("#error-msg-password").hide();
		}

		if (!email) {
			$("#error-msg-email").show();
			$("#email").css("border", "1px solid tomato");
			isValid = false;
		} else {
			$("#error-msg-email").hide();
		}
		
		if (!name) {
			$("#error-msg-name").show();
			$("#name").css("border", "1px solid tomato");
			isValid = false;
		} else {
			$("#error-msg-name").hide();
		}
		
		if (!birthDate) {
			$("#error-msg-birthDate").show();
			$("#birthDate").css("border", "1px solid tomato");
			isValid = false;
		} else {
			$("#error-msg-birthDate").hide();
		}

		if (!telecom) {
			$("#error-msg-telecom").show();
			$("#telecom").css("border", "1px solid tomato");
			isValid = false;
		} else {
			$("#error-msg-telecom").hide();
		}
	
		if (!gender) {
			$("#error-msg-gender").show();
			$("#label-male").css("border", "1px solid tomato");
			$("#label-female").css("border", "1px solid tomato");
			isValid = false;
		} else {
			$("#error-msg-gender").hide();
		}

		if (!country) {
			$("#error-msg-country").show();
			$("#label-non-foreigner").css("border", "1px solid tomato");
			$("#label-foreigner").css("border", "1px solid tomato");
			isValid = false;
		} else {
			$("#error-msg-country").hide();
		}

		if (!phone) {
			$("#error-msg-phone").show();
			$("#phone").css("border", "1px solid tomato");
			isValid = false;
		} else {
			$("#error-msg-phone").hide();
		}
		
		if (!isAgreed) {
			$("#error-msg-agree").show();
			$("#label-agree").css("border", "1px solid tomato");
			isValid = false;
		} else {
			$("#error-msg-agree").hide();
		}
		
		if (isValid)
			e.target.submit();
	});
});