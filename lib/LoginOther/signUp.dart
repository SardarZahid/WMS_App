import 'package:flutter/material.dart';
import 'package:myapp/LoginOther/login.dart'; // Assuming you have a login page

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = "";

  // Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Sign-up logic without Firebase
  void _signUp() {
    if (_formKey.currentState?.validate() ?? false) {
      // If form is valid, proceed with sign up
      setState(() {
        _errorMessage = ''; // Clear any previous error message
      });

      // Simulate successful sign-up
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign Up Successful!')),
      );

      // Navigate to HomePage after successful sign-up (replace HomePage with your actual home screen)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  // Email validator
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Password validator
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password should be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,  // This helps avoid the bottom overflow when keyboard is displayed
      backgroundColor: const Color.fromARGB(255, 243, 245, 247),
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: 
           Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey, // Wrap the form with key for validation
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create a New Account',
                      style: TextStyle(
                        color: Color.fromARGB(255, 8, 8, 8),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        "Email Address",
                        style: TextStyle(
                          color: Color.fromARGB(255, 8, 8, 8),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: _validateEmail, // Validate email
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 25, left: 30),
                      child: Text(
                        "Password",
                        style: TextStyle(
                          color: Color.fromARGB(255, 8, 8, 8),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Create a password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: _validatePassword, // Validate password
                      ),
                    ),
                    if (_errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 30),
                        child: Text(
                          _errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(
                          onPressed: _signUp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 50),
                          child: Text("Already have an account?"),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Go back to LoginPage
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 38, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
        }
}
