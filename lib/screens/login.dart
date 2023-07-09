import 'package:flutter/material.dart';
import 'package:flutter_master/untils/routes.dart';
// import 'package:flutter_master/untils/routes.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   String name="";
   // num x= 1.5;
   bool thisbutton= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/log.png",
              scale: 2.5,
              fit: BoxFit.contain,
            ),
            Text(
              "Welcome $name ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
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
                  onChanged: (val){
                      setState(() {
                        val=name;
                      });
                  },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                    ),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, MyRoutees.homeroute);
            //   },
            //   child: Text("Login"),
            //   style: TextButton.styleFrom(minimumSize: Size(100, 50)),
            // ),
            InkWell(
              onTap:()async{
                setState(() {
                  thisbutton=true;
                });
                await Future.delayed(Duration(seconds: 1));
                Navigator.pushNamed(context, MyRoutees.homeroute);

              },



              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: thisbutton? 50:100,
                height: 50,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  color: Colors.blue,
                  borderRadius: thisbutton? BorderRadius.circular(50): BorderRadius.circular(8)

                ),
                child: thisbutton? Icon(Icons.done, color: Colors.white, ):Text("Login",style: TextStyle(color: Colors.white,fontSize: 18),),
                alignment: Alignment.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
