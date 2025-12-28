import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Screens/Login/loginscreen.dart';
import 'package:flutter_insta_clone/Widgets/uihelper.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.CustomImage(imgurl: "logo.png"),
            SizedBox(height: 30),
            Uihelper.CustomTextField(
              controller: emailController,
              text: "Email",
              tohide: false,
              TextInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            Uihelper.CustomTextField(
              controller: passwordController,
              text: "Password",
              tohide: true,
              TextInputType: TextInputType.text,
            ),
            SizedBox(height: 10),
            Uihelper.CustomTextField(
              controller: usernameController,
              text: "Username",
              tohide: false,
              TextInputType: TextInputType.name,
            ),
            SizedBox(height: 20),
            Uihelper.CustomButton(
              callback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              Buttonname: "Sign Up",
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                Uihelper.CustomTextButton(
                  text: "Sign In",
                  callback: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
