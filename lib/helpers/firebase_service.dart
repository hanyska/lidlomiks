class FirebaseService {
  static String getMessageFromErrorCode(String errorCode) {
    switch (errorCode) {
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Adres e-mail jest już używany! Przejdź do strony logowania.";
        break;
      case "weak-password":
        return "Podane hasło jest za słabe!";
        break;
      case "ERROR_WRONG_PASSWORD":
        return "Zły email lub hasło";
        break;
      case "ERROR_USER_DISABLED":
        return "Użytkownik jest zablokowany!";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Zbyt wiele żądań zalogowania się na to konto!";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return "Błąd serwera, spróbuj ponownie później!";
        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Adres email jest nieprawidłowy!";
        break;
      default:
        return "Logowanie nie powiodło się. Proszę spróbuj ponownie.";
        break;
    }
  }
}