/*
// Legacy backup of Home screen.
// This file is intentionally left minimal to avoid compilation issues.
// Not used by the application.

// ignore_for_file: unused_import
import 'package:flutter/material.dart';

// Empty placeholder widget (not referenced anywhere).
class _LegacyHomeBackup extends StatelessWidget {
  const _LegacyHomeBackup({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

import 'package:body_ai_buddy/components/bottom_navbar.dart';
import 'package:body_ai_buddy/screens/symptom_check.dart';
import 'package:body_ai_buddy/screens/nutrition.dart';
import 'package:body_ai_buddy/screens/mental_health.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
*/

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(),
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildHeader(context),
                  const SizedBox(height: 30),
                  _buildWelcomeCard(context),
                  const SizedBox(height: 30),
                  _buildQuickActions(context),
                  const SizedBox(height: 30),
                  _buildHealthMetrics(context),
                  const SizedBox(height: 30),
                  _buildConnectDevicesCard(context),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary,
                theme.colorScheme.secondary,
              ],
            ),
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.person,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning! 👋',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Welcome back',
                style: theme.textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
          const SizedBox(height: 20,),
          Card(
            elevation: 5,
            color: const Color(0xFFead2c6),
            child: Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      const Text('Transform \n Your Health,\n Transform your life!', 
                      style: TextStyle(fontSize: 20,
                      ),),
                      const SizedBox(height: 10,),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Home() ));
                      ();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF44544b),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      minimumSize: const Size(50, 40),
                    ),
                    child: const Text('Check symptoms', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                ),)
                    ],
                  ),
                  Image.asset(
                    'assets/images/nurse.png',
                    width: 160,
                    height: 200,
                    ),
                ],
              ),),
            ),
            const SizedBox(height: 5,),
            Row(
              children: [
                Card(
              elevation: 5,
              color:const Color(0xFF86b7a4),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
               
                borderRadius: BorderRadius.circular(7)
              ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 5, left: 10),

                        child: Text(' Mental Health \n Check',
                        style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.bold,
                      ),),),
                        const SizedBox(height: 10,),
                        Padding(padding: const EdgeInsets.only(right: 80, bottom: 0),
                      child: IconButton(onPressed: () {}, 
                        icon: const Icon(Icons.arrow_circle_right_outlined, color: Color(0xFF44544b), size: 60,))),
                        Image.asset(
                    'assets/images/rb_2038.png',
                    width: 80,
                    height: 80,
                    ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10,),
            Card(
              elevation: 5,
              color:const Color(0xFFbf5235),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/food.png"),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(7)
              ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 10, left: 10),
                        
                        child: Text('Nutrition Plan',
                        style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),),),
                        const SizedBox(height: 110,),
                        Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Home() ));
                      ();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF44544b),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      minimumSize: const Size(50, 40),
                    ),
                    child: const Text('Get Started', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),),
                ),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
              ],
            ),
            const SizedBox(height: 10,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.monitor_heart_outlined, 
                    size: 100,
                    color: Colors.pinkAccent,),
                    SizedBox(height: 10,),
                    Text('Heart Rate- BP: 70',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    Icon(Icons.water_drop_outlined, 
                    size: 100,
                    color: Colors.lightBlue,),
                    SizedBox(height: 10,),
                    Text('Oxygene: 100%',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                  ],
                ),
                
              ],
            ),
            const SizedBox(height: 15,),
            Card(
            elevation: 5,
            color: const Color(0xFF86b7a4),
            child: Container(
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/watch.png"),
                  fit: BoxFit.contain,
                  alignment: Alignment.centerRight
                ),),
              child: Row(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 20,),
                      const Text('Connect  \n your devices', 
                      style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10,),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Home() ));
                      ();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF44544b),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      minimumSize: const Size(50, 40),
                    ),
                    child: const Text('Connect Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                ),)
                    ],
                  ),
                ],
              ),),
            ),

          
        ],
      ),
      ),
      ),

    );
  }
}