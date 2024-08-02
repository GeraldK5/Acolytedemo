import 'dart:convert';
import 'package:acolyte/NavigationScreens/BottomNavigationBar.dart';
import 'package:acolyte/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  String phonenumber = '';
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  bool obscureText = true;
  bool _isLoading = false;
  bool login = false;

  Map<String, dynamic> userRecord = {};

  bool isValidEmail(String email) {
    // Use a regular expression to validate the email format
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'images/pesa2.png',
                            height: 120,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Welcome back',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Sign into your account')
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter your login details',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  IntlPhoneField(
                                    initialCountryCode: 'UG',
                                    showDropdownIcon: false,
                                    pickerDialogStyle: PickerDialogStyle(
                                        backgroundColor: Colors.white),
                                    keyboardType: TextInputType.phone,
                                    onChanged: (value) {
                                      setState(() {
                                        phonenumber =
                                            value.countryCode + value.number;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Phone Number',
                                        suffixIcon: Icon(Icons.phone)),
                                    validator: (value) {
                                      if (value!.number.isEmpty) {
                                        return 'Please enter the phone number';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    obscureText: obscureText,
                                    controller: password,
                                    decoration: InputDecoration(
                                      hintText: '4- Digit PIN',
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            obscureText = !obscureText;
                                          });
                                        },
                                        icon: Icon(
                                          obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(4),
                                    ],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter the PIN';
                                      } else if (value.length != 4) {
                                        return 'PIN must be 4 digits';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     Custompageroute(
                              //         child: phonenumberCheck(),
                              //         direction: true));
                            },
                            child: Text(
                              'Forgot your password?',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  _isLoading = true;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BottomNavBar(selected: 0)));
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(double.maxFinite, 50),
                              backgroundColor: Color(0XFF3d4ee6),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            child: _isLoading
                                ? const CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : Text(
                                    'Sign In',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Not yet a member? ',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Color(0XFF3d4ee6),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
