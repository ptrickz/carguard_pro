import 'package:carguard_pro/features/auth/login.dart';
import 'package:carguard_pro/features/auth/register.dart';
import 'package:carguard_pro/globals/colors.dart';
import 'package:carguard_pro/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: white,
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  bottom: -120,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset('assets/images/car.svg'),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              image: const DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    CustomElevatedButton(
                        enabled: true,
                        isGhost: false,
                        callback: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        title: 'Login'),
                    const Gap(20),
                    CustomElevatedButton(
                      enabled: true,
                      isGhost: true,
                      callback: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      title: 'Register',
                    )
                  ],
                ),
              ],
            )));
  }
}
