import "dart:async";

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (String email, sink) {
      if (email.contains("@")) {
        sink.add(email);
      } else {
        sink.addError("Invalid email");
      }
    },
  );

  final validePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (String password, sink) {
    if (password.length < 4) {
      sink.addError('Invalid password');
    } else {
      sink.add(password);
    }
  });
}
