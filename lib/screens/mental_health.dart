import 'package:body_ai_buddy/components/bottom_navbar.dart';
import 'package:body_ai_buddy/screens/chat_mental.dart';
import 'package:flutter/material.dart';

class MentalHealth extends StatelessWidget {
  const MentalHealth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFead2c6),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios), color: const Color(0xFF44544b),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
      body:  SingleChildScrollView(
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ChatMental()
                      )
                    );
                },
                child: Card(
                elevation: 10,
                color: Color(0xFF86b7a4),
                child: Padding(padding: EdgeInsets.only(right: 35, left: 35, top: 40, bottom: 40),
                child: Column(
                  children: [
                    Icon(Icons.chat,
                    size: 60,
                    color: Colors.white,),
                    Text('Chat bot', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30),)
                  ],
                )
                )
              ),

              ),
              SizedBox(width: 5,),
              Card(
                elevation: 10,
                color: Color(0xFF86b7a4),
                child: Padding(padding: EdgeInsets.only(right: 25, left: 25, top: 30, bottom: 30),
                child: Column(
                  children: [
                    Icon(Icons.self_improvement,
                    size: 80,
                    color: Colors.white,),
                    Text('Meditation', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30),)
                  ],
                )
                )
              )
            ],
          ),
          SizedBox(height: 30,),
           Row(
            children: [
              Card(
                elevation: 10,
                color: Color(0xFF86b7a4),
                child: Padding(padding: EdgeInsets.only(right: 30, left: 30, top: 40, bottom: 40),
                child: Column(
                  children: [
                    Icon(Icons.speaker,
                    size: 60,
                    color: Colors.white,),
                    Text('Podcasts', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30),)
                  ],
                )
                )
              ),
              SizedBox(width: 5,),
              Card(
                elevation: 10,
                color: Color(0xFF86b7a4),
                child: Padding(padding: EdgeInsets.only(right: 15, left: 15, top: 40, bottom: 40),
                child: Column(
                  children: [
                    Icon(Icons.edit_document,
                    size: 60,
                    color: Colors.white,),
                    Text('Assesments', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30),)
                  ],
                )
                )
              )
            ],
          ),
          SizedBox(height: 30,),
            Card(
                elevation: 10,
                color: Color(0xFF86b7a4),
                child: Padding(padding: EdgeInsets.only(top: 20, bottom: 20, right: 50, left: 50),
                child: Column(
                  children: [
                    Icon(Icons.mic,
                    size: 60,
                    color: Colors.white,),
                    SizedBox(height: 5,),
                    Text('Would you like to rant', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30),)
                  ],
                )
                )
              ),
          SizedBox(height: 30,),
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                color: Colors.black, 
                width: 2, 
              ),),
            child:Padding(padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Text('"', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),),
                Text('You have power over your mind- not outside events. Realize this and you will find strength',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,)
              ],
            ),
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
      ),
      ),
    );
  }
}