import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const routeName = '/register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstNameTextController = TextEditingController();
  final _lastNameNameController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _phoneNumberTextController = TextEditingController();

  final _lastNameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _obsecureText = true;

  @override
  void dispose() {
    _firstNameTextController.dispose();
    _lastNameNameController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _phoneNumberTextController.dispose();
    _lastNameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.23,
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.045),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Let\'s get you started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(
                  height: 18,
                ),
                const ContainerWidget(),
                const SizedBox(
                  height: 18,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(_lastNameFocusNode),
                              controller: _firstNameTextController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your first name';
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: 'First name',
                                hintStyle: const TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(_emailFocusNode),
                              controller: _firstNameTextController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your last name';
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: 'Last name',
                                hintStyle: const TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_phoneNumberFocusNode),
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
                        height: 20,
                      ),
                      IntlPhoneField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                            
                          ),
                        ),
                        initialCountryCode: 'UG',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () => {},
                        //_submitFormOnLogin(),
                        controller: _passwordTextController,
                        //focusNode: _passFocusNode,
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
                        height: 15,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'A minimum of 6 characters is required',
                            style: TextStyle(color: Colors.grey),
                          )),
                      const SizedBox(
                        height: 35,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.94,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 135, 148, 53),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text('Continue',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const BottomRichText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomRichText extends StatelessWidget {
  const BottomRichText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By clicking "Continue", you agree to our to pawa.ng ',
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 16,
        ),
        children: [
          const TextSpan(
            text: 'terms or service ',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: 'and ',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
          ),
          const TextSpan(
            text: 'privacy policy ',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.92,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 18, bottom: 18),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 236, 245, 178),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Your ',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 15,
              ),
              children: [
                const TextSpan(
                  text: 'first name ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: 'and ',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 15,
                  ),
                ),
                const TextSpan(
                  text: 'last name ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: 'must be associated ',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'with',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 15,
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'your ',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 15,
              ),
              children: const [
                TextSpan(
                  text: 'BVN name',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
