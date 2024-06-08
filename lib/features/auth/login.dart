import 'dart:async';

import 'package:carguard_pro/features/auth/register.dart';
import 'package:carguard_pro/features/home/home.dart';
import 'package:carguard_pro/globals/colors.dart';
import 'package:carguard_pro/widgets/button.dart';
import 'package:carguard_pro/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObscured = true;
  bool isRemembered = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid(String email) {
    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: primary,
        appBar: AppBar(
          surfaceTintColor: transparent,
          backgroundColor: transparent,
          automaticallyImplyLeading: false,
          leadingWidth: 100,
          leading: TextButton.icon(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              CupertinoIcons.chevron_back,
              color: white,
            ),
            label: const Text(
              'Back',
              style: TextStyle(color: white),
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Image.asset(
                  'assets/images/bglogin.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: primary,
                        ),
                      ),
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            const Gap(20),
                            CustomTextFormField(
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email address';
                                } else if (!isEmailValid(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              controller: emailController,
                              iconData: CupertinoIcons.mail_solid,
                              hintText: 'Email',
                              isPassword: false,
                            ),
                            const Gap(20),
                            CustomTextFormField(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isObscured = !isObscured;
                                  });
                                },
                                child: Icon(
                                  isObscured
                                      ? CupertinoIcons.eye_fill
                                      : CupertinoIcons.eye_slash_fill,
                                  color: grey,
                                ),
                              ),
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              iconData: CupertinoIcons.lock_open_fill,
                              hintText: 'Password',
                              isPassword: true,
                              isObscured: isObscured,
                            ),
                            const Gap(20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox.adaptive(
                                          activeColor: primary,
                                          value: isRemembered,
                                          onChanged: (val) {
                                            setState(() {
                                              isRemembered = val!;
                                            });
                                          }),
                                      const Text('Remember Me'),
                                    ],
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          WidgetStateProperty.all<Color>(
                                              primary),
                                    ),
                                    onPressed: () {},
                                    child: const Text('Forgot Password'),
                                  ),
                                ],
                              ),
                            ),
                            const Gap(20),
                            CustomElevatedButton(
                              enabled: true,
                              isGhost: false,
                              callback: () async {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Logging in...'),
                                  ));
                                  Timer(const Duration(seconds: 3), () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (contextxt) =>
                                            const HomePage(),
                                      ),
                                    );
                                  });
                                }
                              },
                              title: 'Login',
                            ),
                            const Gap(20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Don't have an account?"),
                                  TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          WidgetStateProperty.all<Color>(
                                              primary),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage(),
                                        ),
                                      );
                                    },
                                    child: const Text('Register Now'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
