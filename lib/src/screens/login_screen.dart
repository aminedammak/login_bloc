import "package:flutter/material.dart";

import "../blocs/bloc.dart";

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          emailField(),
          passwordField(),
          Container(
            margin: EdgeInsets.only(bottom: 20),
          ),
          submitButton(),
        ],
      ),
    );
  }
}

Widget emailField() {
  return StreamBuilder(
    stream: bloc.email,
    builder: (context, snapshot) {
      print("builder invoked");
      return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "you@example.com",
          errorText: snapshot.error?.toString(),
        ),
        onChanged: bloc.changeEmail,
      );
    },
  );
}

Widget passwordField() {
  return TextField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: "Password",
    ),
  );
}

Widget submitButton() {
  return ElevatedButton(onPressed: () {}, child: Text("Submit"));
}
