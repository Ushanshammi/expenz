import 'package:expenz_app07/constant/colors.dart';
import 'package:expenz_app07/constant/constant.dart';
import 'package:expenz_app07/model/custom_button.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //checkbox value
  bool rememberMe = false;

  //form key for the form validation
  final formkey = GlobalKey<FormState>();
  //
  //controller for the text fields
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "       Enter Your \nPersonal Details",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 30),

                //form
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      //form field for the username
                      TextFormField(
                        controller: userNameController,
                        validator: (value) {
                          //check if the field is empty
                          if (value!.isEmpty) {
                            return "Please enter your name";
                          }
                        },

                        decoration: InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      //email
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          } else if (!RegExp(
                            r'^[^@]+@[^@]+\.[^@]+',
                          ).hasMatch(value)) {
                            return "Please enter a valid email";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your password";
                          } else if (value.length < 6) {
                            return "Password must be at least 6 characters long";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter Same password ";
                          } else if (value.length < 6) {
                            return "Password must be at least 6 characters long";
                          } else if (value != passwordController.text) {
                            return "Passwords do not match";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Remember Me for the next time",
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: kMainColor,
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      GestureDetector(
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            // If the form is valid, proceed to the next screen
                            String userName = userNameController.text;
                            String email = emailController.text;
                            String password = passwordController.text;
                            String confirmPassword =
                                confirmPasswordController.text;
                            print(
                              " $userName $email $password $confirmPassword",
                            );
                          }
                        },
                        child: CustomButton(
                          name: "Next",
                          buttonColor: kMainColor,
                        ),
                      ),
                    ],
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
