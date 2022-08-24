const String emptyEmailField = 'Email field cannot be empty!';
const String emptyTextField = 'Field cannot be empty!';
const String emptyPasswordField = 'Password field cannot be empty';
const String invalidEmailField =
    "Email provided isn't valid.Try another email address";
const String passwordLengthError = 'Password length must be greater than 8';
const String invalidPassword = 'Password must meet all requirements';
const String emptyUsernameField = 'Username  cannot be empty';
const String usernameLengthError = 'Username length must be greater than 6';
const String emailRegex = '[a-zA-Z0-9+._%-+]{1,256}'
    '\\@'
    '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}'
    '('
    '\\.'
    '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}'
    ')+';
const String passwordRegex =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
const String upperCaseRegex = r'^(?=.*?[A-Z]).{1,}$';
const String lowerCaseRegex = r'^(?=.*?[a-z]).{1,}$';
const String symbolRegex = r'^(?=.*?[!@#\$&*~]).{1,}$';
const String digitRegex = r'^(?=.*?[0-9]).{1,}$';


const String phoneNumberRegex = r'0[789][01]\d{8}';

const String phoneNumberLengthError = 'Phone number must be 11 digits';

const String invalidPhoneNumberField =
    "Number provided isn't valid.Try another phone number";
