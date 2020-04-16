import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate/constants/colors.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "LOGO",
            style: TextStyle(
              fontFamily: "Avenir",
              fontSize: 36,
              fontWeight: FontWeight.w300,
              color: blue,
            ),
          ),
          Text(
            "Hello there!",
            style: TextStyle(
              fontFamily: "Avenir",
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: gray,
            ),
          ),
          Opacity(
            opacity: .5,
            child: Text(
              "Sign in to access your account",
              style: TextStyle(
                color: gray,
                fontFamily: "Avenir",
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextField(String hintText, bool isPassword) {
    return TextField(
      obscureText: isPassword,
      style: TextStyle(
        fontFamily: "Avenir",
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildFormRow(String iconPath, String hintText, bool isPassword) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE6E6E6),
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(iconPath),
          SizedBox(width: 10),
          Flexible(
            child: _buildTextField(hintText, isPassword),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          _buildFormRow("assets/images/email.svg", "Email", false),
          SizedBox(height: 15),
          _buildFormRow("assets/images/lock.svg", "Password", true),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {},
              padding: EdgeInsets.symmetric(vertical: 15),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: blue,
              textColor: Colors.white,
              child: Text(
                'Sign in',
                style: TextStyle(
                  fontFamily: "Avenir",
                  fontSize: 16,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Forgot password");
            },
            child: Container(
              padding: EdgeInsets.all(20),
              child: Opacity(
                opacity: .5,
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    const footerStyle = TextStyle(fontFamily: "Avenir", fontSize: 14);
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "Don't have an account?",
            style: footerStyle,
          ),
          GestureDetector(
            onTap: () {
              print("Register");
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Register here",
                style: footerStyle.copyWith(color: blue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildHeader(),
                // SizedBox(height: 100),
                _buildForm(),
                // SizedBox(height: 200),
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
