import "dart:async";
import "../mixins/validators.dart";
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //Add data to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // Change data
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validePassword);

  Stream<bool> get submitValid =>
      CombineLatestStream.combine2(email, password, (a, b) => true);

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;
    print("email is $validEmail");
    print("Password is $validPassword");
  }
}

//final bloc = Bloc();
