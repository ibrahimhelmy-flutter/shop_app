import 'package:flutter/material.dart';
import 'package:shop_app/presentation/screens/login_screen.dart';
import 'package:shop_app/shared/component.dart';

class RegisterScreen extends StatelessWidget {
  static const String id="/register";
  // const LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Register"),
                Text("Register now to browse our hot offer"),
                SizedBox(height: 30),
                defaultFormField(        onTap: (){},
                    controller: emailController,
                    label: "Email Address",
                    prefix: Icons.mail_outline),
                SizedBox(height: 10),
                defaultFormField(        onTap: (){},
                    controller: passController,
                    label: "Email PassWord",
                    prefix: Icons.lock_outline,
                    suffix: Icons.visibility_outlined),
                SizedBox(height: 20),
                defaultButton(function: () {}, text: "Register"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("You Have Account"),
                    TextButton(onPressed: () {
                      Navigator.pushReplacementNamed(context, LoginScreen.id);
                    }, child: Text("LOGIN"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
