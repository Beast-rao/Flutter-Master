import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset("assets/images/log.png",scale: 2.5,fit: BoxFit.contain,),
          Text("Welcome ", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText:"Username",
                    labelText: "Name",

                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText:"Password",
                    labelText: "Password",


                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
          ElevatedButton(onPressed: (){
            print("You Pressed Button");
          }, child: Text("Login"),
          style: TextButton.styleFrom(),)

        ],
      ),

    );
  }
}
