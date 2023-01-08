// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/screens/Auth/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _obsecureText = true;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.065),
                   Container(
                    //padding: EdgeInsets.symmetric(horizontal: 40),
                     child: Row(
                       children: [
                        SizedBox(width: MediaQuery.of(context).size.width*0.30,),
                        Container(
                          height: 40,
                          width: 40,
                          child: Image.asset('assets/logo.png',fit: BoxFit.cover, ),
                        ),
                        const SizedBox(width: 8,
                        ),
                         Text('pawa',
                            style: GoogleFonts.lato(color: Colors.black, fontSize: 45, fontWeight: FontWeight.bold)
                                   ),
                       ],
                     ),
                   ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.055),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 22,),
                      child: Text('Login to your account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
                    ),
                  ),
                  // form
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passFocusNode),
                    controller: _emailTextController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.')) {
                        return 'Please enter a valid email address';
                      } else {
                        return null;
                      }
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  // Password Form field
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () => {},
                    //_submitFormOnLogin(),
                    controller: _passTextController,
                    focusNode: _passFocusNode,
                    obscureText: _obsecureText,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Please enter a valid password';
                      } else {
                        return null;
                      }
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obsecureText = !_obsecureText;
                            });
                          },
                          child: Icon(
                            _obsecureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey.shade700,
                            size: 30,
                          )),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.94,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          const Color.fromARGB(255, 135, 148, 53),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text('Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text('Forgot Password?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 40,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: 'Register',
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                //Navigator.pushNamed(context, RegisterScreen.routeName);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                              },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
                  ),
                ]),
            )));
  }
}
