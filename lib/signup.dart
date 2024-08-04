import 'package:acolyte/login.dart';
import 'package:country_picker/country_picker.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  final TextEditingController countrytext = TextEditingController();
  final TextEditingController currencytext = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  bool obscureText = true;
  bool _isLoading = false;

  bool signup = false;
  String userid = "";
  getCountry() {}

  getCurrency() {}

  bool isValidEmail(String email) {
    // Use a regular expression to validate the email format
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    return emailRegex.hasMatch(email);
  }

  bool isPasswordConfirmed(String password, String confirmpassword) {
    return password == confirmpassword;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.name,
                                controller: name,
                                decoration: InputDecoration(
                                    hintText: 'Your name',
                                    prefixIcon: Icon(Icons.person)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the Name';
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: email,
                                decoration: InputDecoration(
                                    hintText: 'Your email',
                                    prefixIcon: Icon(Icons.email)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the Email';
                                  }
                                  if (!isValidEmail(email.text)) {
                                    return 'Enter valid Email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              IntlPhoneField(
                                initialCountryCode: 'UG',
                                controller: phonenumber,
                                showDropdownIcon: false,
                                pickerDialogStyle: PickerDialogStyle(
                                    backgroundColor: Colors.white),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    hintText: 'Phone Number',
                                    prefixIcon: Icon(Icons.phone)),
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
                                readOnly: true,
                                onTap: () => showCountryPicker(
                                    context: context,
                                    countryListTheme: CountryListThemeData(
                                      flagSize: 25,
                                      backgroundColor: Colors.white,
                                      textStyle: TextStyle(
                                          fontSize: 16, color: Colors.blueGrey),
                                      bottomSheetHeight:
                                          500, // Optional. Country list modal height
                                      //Optional. Sets the border radius for the bottomsheet.
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                      ),
                                      //Optional. Styles the search field.
                                      inputDecoration: InputDecoration(
                                        labelText: 'Search',
                                        hintText: 'Start typing to search',
                                        prefixIcon: const Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xFF8C98A8)
                                                .withOpacity(0.2),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onSelect: (Country country) => setState(() {
                                          countrytext.text =
                                              country.displayName;
                                        })),
                                keyboardType: TextInputType.text,
                                controller: countrytext,
                                decoration: InputDecoration(
                                    hintText: 'Select the country',
                                    prefixIcon: Icon(Icons.flag)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select the country';
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                readOnly: true,
                                onTap: () => showCurrencyPicker(
                                  context: context,
                                  showFlag: true,
                                  showCurrencyName: true,
                                  showCurrencyCode: true,
                                  onSelect: (Currency currency) {
                                    setState(() {
                                      currencytext.text = currency.name;
                                    });
                                  },
                                ),
                                keyboardType: TextInputType.text,
                                controller: currencytext,
                                decoration: InputDecoration(
                                    hintText: 'select the currency',
                                    prefixIcon: Icon(Icons.money)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the currency';
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                obscureText: obscureText,
                                controller: password,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4)
                                ],
                                decoration: InputDecoration(
                                  hintText: 'Enter 4-Digit Pin',
                                  prefixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          obscureText = !obscureText;
                                        });
                                      },
                                      icon: Icon(obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the pin';
                                  }
                                  if (!isPasswordConfirmed(
                                      password.text, confirmpassword.text)) {
                                    return 'Please enter matching pins';
                                  }
                                  if (value.length != 4) {
                                    return 'Please enter 4 digit pin';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                  keyboardType: TextInputType.number,
                                  obscureText: obscureText,
                                  controller: confirmpassword,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(4)
                                  ],
                                  decoration: InputDecoration(
                                    hintText: 'Confirm Pin',
                                    prefixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            obscureText = !obscureText;
                                          });
                                        },
                                        icon: Icon(obscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility)),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the pin';
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: 40,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Already a member?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Sign in',
                                      style: TextStyle(
                                          color: Color(0XFF3d4ee6),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          print(phonenumber.text);

                          // Navigator.push(
                          //     context,
                          //    MaterialPageRoute(builder: (context)=> ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(double.maxFinite, 50),
                        backgroundColor: Color(0XFF3d4ee6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                          : Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
