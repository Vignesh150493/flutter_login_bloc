import 'package:flutter/material.dart';
import '../blocs/block.dart';
import '../blocs/provider.dart';

/// To use a single global instance use it from block.dart file. It has been created there as a final variable.
/// Here we have used scoped instance using the of static method in bloc.dart file.
/// Just to mention of both ways of using bloc.

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //SCOPED BLOC! :D
    final bloc = Provider.of(context);
    //SCOPED BLOC! :D

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(top: 25.0),
          ),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'abc@example.com',
              labelText: 'Email Address',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Password',
              errorText: snapshot.error),
        );
      },
      stream: bloc.password,
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: snapshot.hasData ? bloc.submit : null,
          child: Text('Login'),
          color: Colors.blue,
        );
      },
      stream: bloc.submitValid,
    );
  }
}
