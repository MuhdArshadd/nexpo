import 'package:flutter/material.dart';

class RegisterUserPage extends StatefulWidget {
  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  String? selectedQuestion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'NEW USER',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'First Name',
                  hintText: 'Enter your first name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  hintText: 'Enter your last name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                  helperText: 'Email must be in the correct format',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 14),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                  helperText: 'Password must be at least 8 characters',
                ),
                obscureText: true,
              ),
              SizedBox(height: 14),
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
                        padding: EdgeInsets.all(16),
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
                  SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedQuestion = "Where were you born?";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
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
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Answer',
                  hintText: 'Enter your answer',
                  border: OutlineInputBorder(),
                  helperText: 'Answer should be case-sensitive',
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Add register functionality here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 16.0),
                    child: Text('Register'),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
