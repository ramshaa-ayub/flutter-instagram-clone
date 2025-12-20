import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Screens/Bottomnav/bottomnav.dart';
import 'package:flutter_insta_clone/Screens/SignUp/signUpscreen.dart';
import 'package:flutter_insta_clone/Widgets/uihelper.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.CustomImage(imgurl: "logo.png"),
            SizedBox(height: 20),
            Uihelper.CustomTextField(
              controller: emailController,
              text: "Email",
              tohide: false,
              TextInputType: TextInputType.text,
            ),

            SizedBox(height: 15),
            Uihelper.CustomTextField(
              controller: passwordController,
              text: "Password",
              tohide: true,
              TextInputType: TextInputType.visiblePassword,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Uihelper.CustomTextButton(
                    text: "Forgot password?",
                    callback: () {},
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Uihelper.CustomButton(
              callback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavScreen()),
                );
              },
              Buttonname: "Log In",
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.CustomImage(imgurl: "Icon.png"),
                Uihelper.CustomTextButton(
                  text: "Log In with Facebook",
                  callback: () {},
                ),
              ],
            ),

            SizedBox(height: 10),
            Text(
              "OR",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                Uihelper.CustomTextButton(
                  text: "Sign Up",
                  callback: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
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
