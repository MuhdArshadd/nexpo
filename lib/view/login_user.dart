import 'package:flutter/material.dart';
import 'forgot_pass.dart';
import 'home_page_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                  helperText: 'Email must be in correct format',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  // TODO: Implement email validation logic
                  if (value == null || value.isEmpty) {
                    return 'Email must be in the correct format';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                  helperText: 'Password must be at least 8 characters',
                ),
                obscureText: true,
                validator: (value) {
                  // TODO: Implement password validation logic
                  if (value == null || value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement login functionality
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePageLogin()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button color
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // TODO: Implement forgot password functionality
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
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
    );
  }
}
