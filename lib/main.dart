import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:garden_app/screens/AuthPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

      if (isFirstLaunch) {
        prefs.setBool('isFirstLaunch', false);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CarouselPage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AuthPage(isSignup: false)),
        );
      }
    });

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class CarouselPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF4A148C),
              Color(0xFF7B1FA2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: PageView(
          children: [
            _buildCarouselPage(
              context,
              title: 'Welcome',
              description: 'Discover amazing features.',
              icon: Icons.explore,
            ),
            _buildCarouselPage(
              context,
              title: 'Stay Connected',
              description: 'Connect with others easily.',
              icon: Icons.group,
            ),
            _buildCarouselPage(
              context,
              title: 'Get Started',
              description: 'Enjoy using the app!',
              icon: Icons.star,
              showButton: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselPage(BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    bool showButton = false,
  }) {
    return Container(
      padding: EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 100, color: Colors.white),
          SizedBox(height: 24.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          if (showButton) ...[
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AuthPage(isSignup: false)),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Haydi Başlayalım'),
            ),
          ]
        ],
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Main App Page'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}
