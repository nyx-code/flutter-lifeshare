String validateGstinNo(String value) {
  String patttern =
      r"^([0]{1}[1-9]{1}|[1-2]{1}[0-9]{1}|[3]{1}[0-7]{1})([a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9a-zA-Z]{1}[zZ]{1}[0-9a-zA-Z]{1})+$";
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return null;
  } else if (!regExp.hasMatch(value) && value.length != 0) {
    return "Please enter a valid Gstin Number";
  }
  return null;
}

String validateZipCode(String value) {
  if (value.length == 0) {
    return "Zip Code field is Required";
  } else if (value.length != 6) {
    return "Please enter a valid Zip Code";
  }
  return null;
}

String validateMobileNumber(String value) {
  if (value.length == 0) {
    return "Mobile Number field is Required";
  } else if (value.length != 10) {
    return "Please enter a valid Mobile Number";
  }
  return null;
}

String validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return "Email ID field is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Please enter a valid Email ID";
  }
  return null;
}

String validatePassword(String value) {
  if (value.isEmpty) {
    return "Password field is Required";
  } else if (value.length < 0) {
    return "Password should be more than 1 characters";
  }
  return null;
}

String validateName(String value) {
  if (value.isEmpty) {
    return "First name field is required";
  }
  return null;
}

String validateLastName(String value) {
  if (value.isEmpty) {
    return "Last name field is required";
  }
  return null;
}
