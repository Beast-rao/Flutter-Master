import 'package:flutter/material.dart';
import 'package:flutter_master/untils/routes.dart';
import 'package:flutter_master/untils/theme.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:flutter_master/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool thisButton = false;
  final _formKey = GlobalKey<FormState>();

  void moveToHome(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      setState(() {
        thisButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutees.homeroute);
      setState(() {
        thisButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.creamcolor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                30.heightBox,
                Image.asset(
                  "assets/images/log.png",
                  scale: 2.5,
                  fit: BoxFit.contain,
                ),
                30.heightBox,
                Text(
                  "Welcome $name :)",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.darkbluesh,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Username",
                          labelText: "Name",
                        ),
                        validator: (value) {
                          if (value!= null && value.isEmpty) {
                            return "Username can't be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!= null && value.isEmpty) {
                            return "Password can't be empty";
                          } else if (value!.length < 6) {
                            return "Password must contain at least 6 characters";
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: thisButton ? 50 : 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: MyTheme.darkbluesh,
                      borderRadius: thisButton
                          ? BorderRadius.circular(50)
                          : BorderRadius.circular(8),
                    ),
                    child: thisButton
                        ? Icon(
                      Icons.done,
                      color: Colors.white,
                    )
                        : Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
