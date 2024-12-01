import 'package:body_ai_buddy/components/bottom_navbar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(),
      backgroundColor: Colors.white,
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          const SizedBox(height:10),
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(''),
              ),
              const SizedBox(width: 5,),
              const Column(
                children: [
                  Text('Hi'),
                  SizedBox(height:5,),
                  Text('Users name'),
                ],
              ),
              const SizedBox(width: 200,),
              IconButton(onPressed: () {}, 
                icon: const Icon(Icons.notifications))
            ],
          ),
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
                    child: const Text('Check symptoms', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                ),)
                    ],
                  ),
                  Image.asset(
                    'assets/images/nurse.png',
                    width: 200,
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
                image: DecorationImage(
                  image: const AssetImage("images/rb_2038.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(7)
              ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 5, left: 10),

                        child: Text(' Mental Health \n Check',
                        style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ),),),
                        const SizedBox(height: 60,),
                        Padding(padding: const EdgeInsets.only(right: 80, bottom: 0),
                      child: IconButton(onPressed: () {}, 
                        icon: const Icon(Icons.arrow_circle_right_outlined, color: Color(0xFF44544b), size: 60,)))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              color:const Color(0xFFbf5235),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("images/food.png"),
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
                      minimumSize: const Size(50, 50),
                    ),
                    child: const Text('Get Started', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("images/watch.png"),
                  fit: BoxFit.contain,
                  alignment: Alignment.centerRight
                ),),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20,),
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

    );
  }
}