import 'dart:async';

import 'package:blocexample/src/blocs/validators.dart';

class Bloc extends Object with Validators {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();
  //Get Data from stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  //Add data to stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
