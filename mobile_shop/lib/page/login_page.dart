// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Email',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: emailController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black12),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: Colors.orange),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black)),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Password',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            obscureText: true,
            style: TextStyle(color: Colors.black12),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: Colors.orange),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black)),
          ),
        )
      ],
    );
  }

  Widget buildForgetButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forget button is pressd'),
        padding: EdgeInsets.only(right: 0),
        child: Text('Forgot Password?'),
      ),
    );
  }

  Widget buildRememberCb() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                  value: isRememberMe,
                  checkColor: Colors.green,
                  activeColor: Colors.black,
                  onChanged: ((value) {
                    setState(() {
                      isRememberMe = true;
                    });
                  }))),
          Text('Remember me',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget buildLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
          signIn();
        },
        padding: EdgeInsets.all(25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Text(
          'Login',
          style: TextStyle(
              color: Colors.orange, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildSignup() {
    return GestureDetector(
      onTap: () => print("Sign up pressed"),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffB3E2F1),
                    Color(0xffB3E2F1),
                    Color(0xffB3E2F1),
                    Color(0xffB3E2F1),
                  ],
                )),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 50),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildPassword(),
                      buildForgetButton(),
                      buildRememberCb(),
                      buildLoginButton(),
                      buildSignup(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }
}
