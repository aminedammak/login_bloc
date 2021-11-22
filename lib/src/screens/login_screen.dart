import "package:flutter/material.dart";
import "../blocs/bloc.dart";
import "../blocs/provider.dart";

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(bottom: 20),
          ),
          submitButton(bloc),
        ],
      ),
    );
  }
}

Widget emailField(Bloc bloc) {
  return StreamBuilder(
    stream: bloc.email,
    builder: (context, snapshot) {
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

Widget passwordField(Bloc bloc) {
  return StreamBuilder(
    stream: bloc.password,
    builder: (context, snapshot) {
      return TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Password",
          errorText: snapshot.error?.toString(),
        ),
        onChanged: bloc.changePassword,
      );
    },
  );
}

Widget submitButton(Bloc bloc) {
  return StreamBuilder(
    stream: bloc.submitValid,
    builder: (context, snapshot) {
      return ElevatedButton(
        onPressed: snapshot.hasData ? () {} : null,
        child: Text("Submit"),
      );
    },
  );
}
