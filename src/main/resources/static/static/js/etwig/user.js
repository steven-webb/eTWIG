function changePassword(){
	
	// Current password
	var currentPassword = $.trim($('#currentPassword').val());
	if(currentPassword.length == 0){
		warningToast("Current password is required.");
		return;
	}
	
	// New password
	var newPassword = $.trim($('#newPassword').val());
	if(newPassword.length == 0){
		warningToast("New password is required.");
		return;
	}
	
	// Confirm password
	var confirmNewPassword = $.trim($('#confirmNewPassword').val());
	if(newPassword != confirmNewPassword){
		warningToast("The new password must equals to the confirm new password.");
		return;
	}
	
	// Password complexity
	if(!isPasswordComplex(newPassword)){
		warningToast("The new password must be at least 8 characters long and include uppercase, lowercase and numbers.");
		return;	
	}
	
	var passwordObj = {
		currentPassword: currentPassword,
		newPassword: newPassword,
	}
	
	var hasError = true;
	$.ajax({
   		url: '/api/private/changeMyPassword', 
   		type: "POST",
   		async: false,
   		dataType: "json",
   		contentType: "application/json; charset=utf-8",
   		data: JSON.stringify(passwordObj),
   		success: function (result) {
			if(result.error > 0){
				dangerToast("Failed to change password", result.msg);
				hasError = true;
			}else{
				successToast("Password changed successfully.");
				hasError = false;
			}	
    	},
    	error: function (err) {
    		dangerToast("Failed to  change password due to a HTTP " + err.status + " error.", err.responseJSON.exception);
    		hasError = true;
    	}
 	});

	// Post-add operations
	// More timeout if error happens.
	setTimeout(
		function() {
			window.location.reload();
		}, 
		hasError ? 10000 : 2000
	);
}

function isPasswordComplex(password) {
    const minLength = 8;
    const hasUpperCase = /[A-Z]/.test(password);
    const hasLowerCase = /[a-z]/.test(password);
    const hasNumbers = /\d/.test(password);
    //const hasSpecialChars = /[\!\@\#\$\%\^\&\*\(\)\_\+\-\=\[\]\{\}\;\:\'\"\,\<\.\>\/\?\\|\`]/.test(password);

    return password.length >= minLength && hasUpperCase && hasLowerCase && hasNumbers;
}