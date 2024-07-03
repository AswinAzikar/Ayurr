import 'package:ayurr/constant.dart';
import 'package:ayurr/pages/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  bool _isLoading = false;

  Future<bool> _login() async {
    if (!_formKey.currentState!.validate()) {
      return false;
    }

    _formKey.currentState?.save(); // Save form fields

    final url = Uri.parse('https://flutter-amr.noviindus.in/api/Login');

    try {
      setState(() {
        _isLoading = true;
      });

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body:
            'username=${Uri.encodeComponent(_email)}&password=${Uri.encodeComponent(_password)}',
      );

      if (response.statusCode == 200) {
        // Handle successful login response
        final data = json.decode(response.body);
        final token = data['token'];
        print('Login successful: $token');

        _formKey.currentState?.reset();
        return true;
      } else if (response.statusCode == 401) {
        // Invalid credentials
        print('Invalid credentials');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid username or password. Please try again.'),
          ),
        );
        return false;
      } else {
        print('Login failed with status: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed with status: ${response.statusCode}'),
          ),
        );
        return false;
      }
    } catch (e) {
      print('An error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again later.'),
        ),
      );
      return false;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double kht = MediaQuery.of(context).size.height;
    double kwt = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: kht / 5,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://m.economictimes.com/thumb/msid-95993667,width-1200,height-900,resizemode-4,imgsize-137592/ayurveda-and-sexual-health.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: .1 * kht),
                              Text(
                                "Login Or Register to Book \n Your Appointments.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 0.01 * kht),
                                Text(
                                  "Email : ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter an email';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => _email = value!,
                                ),
                                SizedBox(height: .03 * kht),
                                Text(
                                  "Password : ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.length < 8) {
                                      return 'Please enter a password with at least 8 characters';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => _password = value!,
                                ),
                                SizedBox(height: 0.1 * kht),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: kwt * 0.6,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(15),
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: _login,
                                        child: const Text(
                                          'Login',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text.rich(
                    TextSpan(
                      text:
                          'By creating or logging into an account you are agreeing with our ',
                      children: [
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(
                            color: Colors.blue[900],
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Terms and Conditions tapped');
                            },
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Privacy Policy tapped');
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
    );
  }
}
