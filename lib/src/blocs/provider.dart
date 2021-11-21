import 'package:flutter/cupertino.dart';

import "bloc.dart";

class Provider extends InheritedWidget {
  final bloc = Bloc();

  // To give the Provide the possibility to have a child
  Provider({Key? key, required Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .bloc;
  }
}
