import 'package:body_ai_buddy/screens/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            )
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Text('Register', 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 40, 
                color: Color(0xFF44544b)
                ),),
                const SizedBox(height: 60,),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: "Enter Name",
                    hintStyle: const TextStyle(fontWeight: FontWeight.bold,),
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
                const SizedBox(height: 60,),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: "Enter Email",
                    hintStyle: const TextStyle(fontWeight: FontWeight.bold,),
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
                const SizedBox(height: 60.0,),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: const TextStyle(fontWeight: FontWeight.bold,),
                    fillColor:Colors.grey[200],
                    filled: true,
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
                const SizedBox(height: 60,),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Login() ));
                      ();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF44544b),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      minimumSize: const Size(200, 70),
                    ),
                    child: const Text('create account', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Already have an account?",
                  style: TextStyle(color: Color(0xFF44544b)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Login(),
                    ));
                  },
                  child: const Text(
                    'Log in Here',
                    style: TextStyle(color: Color(0xFF4d302a)),
                  ),
                ),

            ],
          ),
          )
        ],
      ),),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);

    path.quadraticBezierTo(
      size.width / 4,
      size.height, 
      size.width / 2, 
      size.height - 50, 
    );

    path.quadraticBezierTo(
      size.width * 3 / 4,
      size.height - 100, 
      size.width, 
      size.height - 50, 
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}