import 'package:flutter/material.dart';

class ContactPersonPage extends StatelessWidget {
  const ContactPersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Person'),
        backgroundColor: Colors.brown,
      ),
      body: Stack(
        children: [
          // Background image with opacity to create a transparent effect
          Opacity(
            opacity:
                0.5, // You can adjust this value for the level of transparency
            child: Image.asset(
              'assets/bg.jpg', // Use your own background image
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Content of the page
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'For any inquiries, feel free to reach out to our support team. We are here to assist you with your needs.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Icon(Icons.phone, color: Colors.brown),
                    const SizedBox(width: 8),
                    const Text(
                      'Phone: +1 234 567 890',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.email, color: Colors.brown),
                    const SizedBox(width: 8),
                    const Text(
                      'Email: support@scentify.com',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 255, 255, 255), // Set the button background color
                  ),
                  onPressed: () {
                    // Add action for contacting or opening email
                  },
                  child: const Text('Contact Support'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
