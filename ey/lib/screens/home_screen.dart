import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/social_button.dart';
import 'registration_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE8FAE0), // Set background color for entire screen
      child: Scaffold(
        backgroundColor: Colors.transparent, // Make Scaffold transparent
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'SevaSetu',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ],
                ),
                
                // Main Content
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo Container
                      Center(
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            color: Colors.white, // White background for logo
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            'assets/seva_setu_logo.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      
                      // Welcome Text
                      const Text(
                        'Hello, Welcome!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'THE BRIDGE BETWEEN YOUR RIGHTS\nAND YOU',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 40),
                      
                      // Login Button
                      CustomButton(
                        text: 'Login',
                        onPressed: () {},
                      ),
                      const SizedBox(height: 15),
                      
                      // Sign Up Button
                      CustomButton(
                        text: 'Sign Up',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationScreen(),
                            ),  // Added missing comma
                          );   // Added missing semicolon
                        },
                      ),
                      const SizedBox(height: 20),
                      
                      // Social Media Section
                      const Text(
                        'Or via social media',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialButton(
                            iconPath: 'assets/google_icon.png',
                            onPressed: () {},
                          ),
                          const SizedBox(width: 20),
                          SocialButton(
                            iconPath: 'assets/facebook_icon.png',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
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