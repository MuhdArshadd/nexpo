import 'package:flutter/material.dart';
import 'package:tourism_app/view/home_page.dart';
import 'package:tourism_app/view/register_user.dart';
import 'forgot_pass.dart';
import 'home_page_login.dart';

class LoginPage extends StatefulWidget {
  final Function(bool) onLoginChanged; // Callback for login state

  const LoginPage({super.key, required this.onLoginChanged});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final ValueNotifier<bool> _isButtonEnabled = ValueNotifier(false);
  String? _errorMessage;


  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _isButtonEnabled.dispose();
    super.dispose();
  }

  void _validateForm() {
    final isValid = _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _formKey.currentState?.validate() == true;

    _isButtonEnabled.value = isValid;
  }

  void _login() {
    if (_emailController.text == 'user@gmail.com' &&
        _passwordController.text == '12345678') {
      // Return true to indicate successful login
      Navigator.pop(context,true);
    } else {
      // Show an error message if the credentials are incorrect
      setState(() {
        _errorMessage = 'Incorrect email or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,

      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32.0),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                    helperText: 'Email must be in correct format',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(),
                    helperText: 'Password must be at least 8 characters',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 7) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24.0),
                ValueListenableBuilder<bool>(
                  valueListenable: _isButtonEnabled,
                  builder: (context, isEnabled, child) {
                    return ElevatedButton(
                      onPressed: isEnabled ? _login : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        isEnabled ? Colors.black : Colors.grey, // Button color
                        padding:
                        const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    );
                  },
                ),
                if (_errorMessage != null) // Display the error message if any
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterUserPage(onLoginChanged: widget.onLoginChanged)),
                        );
                        // Navigate to the registration page
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage()),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
