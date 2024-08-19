import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  //const ForgotPasswordPage({super.key});
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String? selectedQuestion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Forgot Your Password?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Security Question',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedQuestion = "What is your pet's name?";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: selectedQuestion == "What is your pet's name?"
                              ? Colors.blue.withOpacity(0.2)
                              : Colors.white,
                          border: Border.all(
                              color: selectedQuestion == "What is your pet's name?"
                                  ? Colors.blue
                                  : Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          "What is your pet's name?",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedQuestion = "Where were you born?";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: selectedQuestion == "Where were you born?"
                              ? Colors.blue.withOpacity(0.2)
                              : Colors.white,
                          border: Border.all(
                              color: selectedQuestion == "Where were you born?"
                                  ? Colors.blue
                                  : Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          "Where were you born?",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Security Question Answer',
                  hintText: 'Enter your answer',
                  border: OutlineInputBorder(),
                  helperText: 'Answer the security question you set during account creation',
                ),
                validator: (value) {
                  // TODO: Implement validation for the security question answer
                  if (value == null || value.isEmpty) {
                    return 'Please provide an answer to the security question';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                  helperText: 'Provide the email associated with your account',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  // TODO: Implement email validation
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement forgot password functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
