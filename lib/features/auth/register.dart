import 'dart:async';

import 'package:carguard_pro/features/auth/login.dart';
import 'package:carguard_pro/features/home/home.dart';
import 'package:carguard_pro/globals/colors.dart';
import 'package:carguard_pro/widgets/button.dart';
import 'package:carguard_pro/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObscured = true;
  bool isAgreed = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Get Started',
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your full name';
                                  }
                                  return null;
                                },
                                controller: fullNameController,
                                iconData: CupertinoIcons.person_fill,
                                hintText: 'Full Name',
                                isPassword: false,
                              ),
                              const Gap(20),
                              CustomTextFormField(
                                textInputType:
                                    const TextInputType.numberWithOptions(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  return null;
                                },
                                controller: phoneController,
                                iconData: CupertinoIcons.phone_fill,
                                hintText: 'Phone Number',
                                isPassword: false,
                              ),
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
                                controller: confirmPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Field cannot be empty';
                                  } else if (value != passwordController.text) {
                                    return 'Password does not match';
                                  }
                                  return null;
                                },
                                iconData: CupertinoIcons.lock_rotation_open,
                                hintText: 'Confirm Password',
                                isPassword: true,
                                isObscured: isObscured,
                              ),
                              const Gap(20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Checkbox.adaptive(
                                        activeColor: primary,
                                        value: isAgreed,
                                        onChanged: (val) {
                                          setState(() {
                                            isAgreed = val!;
                                          });
                                        }),
                                    const Text(
                                        'I agree to the processing of personal data.'),
                                  ],
                                ),
                              ),
                              const Gap(20),
                              GestureDetector(
                                onTap: isAgreed
                                    ? null
                                    : () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              'Please agree to the processing of personal data.'),
                                        ));
                                      },
                                child: CustomElevatedButton(
                                  enabled: isAgreed,
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
                                  title: 'Register',
                                ),
                              ),
                              const Gap(20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Already have an account?"),
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
                                                const LoginPage(),
                                          ),
                                        );
                                      },
                                      child: const Text('Login'),
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
            ),
          ],
        ),
      ),
    );
  }
}
