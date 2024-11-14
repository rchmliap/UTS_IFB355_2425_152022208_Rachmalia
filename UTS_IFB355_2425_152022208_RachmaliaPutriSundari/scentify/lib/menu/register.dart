import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Opacity(
            opacity: 0.7, // Adjust opacity to your preference
            child: Image.asset(
              'assets/bg.jpg', // Path to your background image
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Main Content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.white.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          const Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.brown), // Same brown as login header
                          ),
                          const SizedBox(height: 24),
                          // Email Text Field
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email,
                                  color: Colors.brown), // Brown icon
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Password Text Field
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock,
                                  color: Colors.brown), // Brown icon
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 16),
                          // Confirm Password Text Field
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Confirm Password',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock,
                                  color: Colors.brown), // Brown icon
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 24),
                          // Register Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.brown, // Same brown as login button
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(
                                    context); // Handle registration action
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                    color:
                                        Colors.white), // White text on button
                              ),
                            ),
                          ),
                          const SizedBox(height: 16), // Space between buttons
                          // Cancel Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.grey, // Grey color for Cancel button
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(
                                    context); // Go back to the previous page
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    color:
                                        Colors.white), // White text on button
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
