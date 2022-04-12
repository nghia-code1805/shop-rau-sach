function validateSignup()
{
    var message = "" ; 
    
    if(!validatePassword()){
        message += "* passwords not match <br>";
    }
    
    if(!validatePhone()){
        message += "* invalid phone number <br>";
    }
    
    if(message)
    {
        document.getElementById("error").style.display = "block";
        document.getElementById("error").innerHTML = message; 
        return false;
    }
    else return true;
   
   
}
function validatePassword()
{

    var pass = document.getElementById("SignupPassword").value;
    var confirmPass = document.getElementById("SignupConfirmPassword").value;
    var comparePass = pass.localeCompare(confirmPass);
    return comparePass === 0 ;
}

function validatePhone()
{
    var phone = document.getElementById("SignupPhone").value;
    return /(((\+|)84)|0)(3|5|7|8|9)+([0-9]{8})\b/.test(phone);
}
		