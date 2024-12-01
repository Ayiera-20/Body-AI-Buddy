import 'package:flutter/material.dart';

class Nutrition extends StatefulWidget {
  const Nutrition({super.key});

  @override
  State<Nutrition> createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Nutrition Plan'),
        backgroundColor: const Color(0xFFead2c6),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios), color: const Color(0xFF44544b),
        ),
      ),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text('Select your desired goal'),
          SizedBox(height: 20,),
          Expanded(
            child: ListView(
            children: [
              _buildCard('Boos Immunity'),
              _buildCard('Weight Mangement'),
              _buildCard('Improve digestive health'),
              _buildCard('Enhance Energy Levels'),
            ],
          )
          ),
          // SizedBox(height: 30,),
          Text('Input your own peronalized goal',
          style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,),
          SizedBox(height: 10,),
          TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: "Type here",
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent), 
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
          const SizedBox(height: 30,),
                ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const Home() ));
                      // ();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF44544b),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      minimumSize: const Size(200, 70),
                    ),
                    child: const Text('Generate', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                ),
                SizedBox(height: 10,)
          
        ],
      ),)
    );
  }
  Widget _buildCard(String title){
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(title),
        leading: Icon(Icons.arrow_forward_outlined),
      ),
    );
  }
  
  }
  