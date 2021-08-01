import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/blocs/login_cubit.dart';
import 'package:shop_app/presentation/screens/register_screen.dart';
import 'package:shop_app/shared/component.dart';

class LoginScreen extends StatelessWidget {
  static const String id = "/login";

  // const LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status!) {
              buildShowToast(
                  msg: state.loginModel.message!, color: Colors.green);
            } else {
              buildShowToast(
                  msg: state.loginModel.message!, color: Colors.red);
            }
          }
        },
        builder: (context, state) {
          var login = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Login"),
                        Text("login now to browse our hot offer"),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Should Not Be Empty";
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Email Address",
                            prefixIcon: Icon(Icons.mail_outline),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                            controller: passController,
                            obscureText: login.isPassword,
                            validator: (value) {
                              if (value!.length < 6) {
                                return "Password Too Short";
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Email password",
                                prefixIcon: Icon(Icons.lock_outline),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      login.changePasswordVisibilty();
                                    },
                                    icon: Icon(login.isPassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined)),
                                border: OutlineInputBorder())),
                        SizedBox(height: 20),
                        state is! LoginLoadingState
                            ? defaultButton(
                                function: () {
                                  if (globalKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passController.text,
                                    );
                                  }
                                },
                                text: "LOGIN")
                            : Center(
                                child: CircularProgressIndicator(),
                              ),
                        // Center(child: Text(login.errorMessage)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("You don\'t Have Account"),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, RegisterScreen.id);
                                },
                                child: Text("REGISTER"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


}
