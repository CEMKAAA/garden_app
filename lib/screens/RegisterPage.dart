import 'package:flutter/material.dart';
import 'package:garden_app/screens/AuthPage.dart';

class RegisterPage extends StatelessWidget {
  final bool isSignup;

  RegisterPage({required this.isSignup});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.3, // Adjust the height as needed
              child: Image.asset(
                'assets/topperImage.png',
                fit: BoxFit.cover,
              ),
            ),

          // Hovering Container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),

                    // Logo and tagline
                    Column(
                      children: const [
                        Text(
                          "GARDEN",
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          "Stay in Touch",
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),

                    // Form
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isSignup ? "Create your account" : "Sign in to your account",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              isSignup ? "Already have an account? " : "Don't have an account? ",
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AuthPage(isSignup:false)),
                                );
                              },
                              child: Text(
                                isSignup ? "Sign in" : "Sign up",
                                style: const TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Email field
                        const TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            hintText: "example@example.com",
                            labelText: "E-mail",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Password field
                        const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.key),
                            hintText: "Enter your password",
                            labelText: "Password",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Forgot Password
                        

                        const SizedBox(height: 20),

                        // Login button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              isSignup ? "Sign Up" : "Login",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
