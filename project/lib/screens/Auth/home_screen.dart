// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/screens/Auth/register_screen.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.065),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.30,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text('pawa',
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 45,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text('All your payment needs in one cashback app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.94,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 135, 148, 53),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text('Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.045),
                  //rich text
                  RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: 'Register',
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                              recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
