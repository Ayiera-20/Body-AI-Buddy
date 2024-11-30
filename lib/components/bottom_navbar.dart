import 'package:body_ai_buddy/screens/home.dart';
import 'package:body_ai_buddy/screens/mental_health.dart';
import 'package:body_ai_buddy/screens/nutrition.dart';
import 'package:body_ai_buddy/screens/profile.dart';
import 'package:body_ai_buddy/screens/symptom_check.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
  data: Theme.of(context).copyWith(
    canvasColor: const Color(0xFFead2c6), 
    primaryColor: Color(0xFF44544b),
    bottomNavigationBarTheme: Theme.of(context).bottomNavigationBarTheme.copyWith(
      selectedLabelStyle: const TextStyle(color: Color(0xFF44544b)),
      unselectedLabelStyle: const TextStyle(color: Colors.white),
    ),
      
      ),
      child: BottomNavigationBar(
        selectedItemColor: Color(0xFF44544b),
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.healing_outlined),
        label: 'Symptoms',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.lunch_dining_rounded),
        label: 'Nutrition',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.psychology),
        label: 'Mental Health',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_2),
        label: 'Profile',
      ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;  
          });
          if (index == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Home(
                ),
              ),
            );
            } else if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SymptomCheck(),
              ));
          } else if (index == 2) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Nutrition()
              ));
          } else if (index == 3) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const MentalHealth(),
            ));
          } else if (index == 4) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Profile()
            ));
          }
        },
      ),
    );
  }
  }